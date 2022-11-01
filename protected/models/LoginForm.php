<?php
/* * ********************************************************************************************
 * 								Open Real Estate
 * 								----------------
 * 	version				:	V1.36.0
 * 	copyright			:	(c) 2015 Monoray
 * 							http://monoray.net
 * 							http://monoray.ru
 *
 * 	website				:	http://open-real-estate.info/en
 *
 * 	contact us			:	http://open-real-estate.info/en/contact-us
 *
 * 	license:			:	http://open-real-estate.info/en/license
 * 							http://open-real-estate.info/ru/license
 *
 * This file is part of Open Real Estate
 *
 * ********************************************************************************************* */

class LoginForm extends CFormModel
{

    public $username;
    public $password;
    public $rememberMe;
    public $verifyCode;

    const ATTEMPTSLOGIN = 3;

    private $_identity;
    public $allowLoginAction = true;

    public function rules()
    {
        $rules = array(
            array('username', 'filter', 'filter' => 'trim'),
            array('username, password', 'required'),
            array('rememberMe', 'boolean'),
            array('password', 'authenticate'),
        );

        $rules[] = array('verifyCode', 'required', 'on' => 'withCaptcha');

        $rules[] = array('verifyCode', 'CustomCaptchaValidatorFactory', 'on' => 'withCaptcha');

        return $rules;
    }

    public function attributeLabels()
    {
        return array(
            'username' => Yii::t('common', 'E-mail'),
            'password' => Yii::t('common', 'Password'),
            'rememberMe' => Yii::t('common', 'Remember me next time'),
            'verifyCode' => tc('Verify Code'),
        );
    }

    public function authenticate($attribute, $params)
    {
        if (!$this->hasErrors()) {
            $this->_identity = new UserIdentity($this->username, $this->password, $this->allowLoginAction);
            if (!$this->_identity->authenticate()) {
                $this->addError('password', Yii::t('common', 'Incorrect username or password.'));
            }
        }
    }

    /**
     * Logs in the user using the given username and password in the model.
     * @return boolean whether login is successful
     */
    public function login()
    {
        $this->_identity = new UserIdentity($this->username, $this->password, $this->allowLoginAction);
        $this->_identity->authenticate();

        if ($this->_identity->errorCode === UserIdentity::ERROR_NONE) {
            if ($this->allowLoginAction) {
                $duration = $this->rememberMe ? 3600 * 24 * 30 : 0; // 30 days
                Yii::app()->user->login($this->_identity, $duration);
            }
            return true;
        }

        return false;
    }

    /**
     * Logs from social account in the user using the given username and password in the model.
     * @return boolean whether login is successful
     */
    public function loginById($id = '')
    {
        $this->_identity = new UserIdentitySocial($id);
        $this->_identity->authenticate();

        if ($this->_identity->errorCode === UserIdentity::ERROR_UNKNOWN_IDENTITY) {
            return 'deactivate';
        }

        if ($this->_identity->errorCode === UserIdentity::ERROR_NONE) {
            $duration = $this->rememberMe ? 3600 * 24 * 30 : 0; // 30 days
            Yii::app()->user->login($this->_identity, $duration);
            return true;
        }

        return false;
    }

    public function afterLogin()
    {
        Yii::app()->user->setState('attempts-login', 0);

        User::updateUserSession();
        User::updateLatestInfo(Yii::app()->user->id, Yii::app()->controller->currentUserIp);

        $returnUrl = Yii::app()->user->returnUrl;

        if ($returnUrl && (strripos(Yii::app()->controller->createUrl('/'), trim($returnUrl, '/')) || trim($returnUrl, '/') == Yii::app()->controller->createUrl('/'))) {
            $returnUrl = null;
        }

        if (Yii::app()->user->checkAccess('stats_admin')) {
            if (demo()) {
                NewsProduct::getProductNews();
                Yii::app()->controller->redirect(array('/stats/backend/main/admin'));
            } else {
                if ($returnUrl) {
                    Yii::app()->controller->redirect($returnUrl);
                }

                NewsProduct::getProductNews();
                Yii::app()->controller->redirect(array('/stats/backend/main/admin'));
            }
            Yii::app()->end();
        } elseif (Yii::app()->user->checkAccess('apartments_admin')) {
            if (demo()) {
                NewsProduct::getProductNews();
                Yii::app()->controller->redirect(array('/apartments/backend/main/admin'));
            } else {
                if ($returnUrl) {
                    Yii::app()->controller->redirect($returnUrl);
                }

                NewsProduct::getProductNews();
                Yii::app()->controller->redirect(array('/apartments/backend/main/admin'));
            }
            Yii::app()->end();
        }

        if ($returnUrl) {
            Yii::app()->controller->redirect($returnUrl);
        } else {
            Yii::app()->controller->redirect(array('/usercpanel/main/index'));
        }
    }
}
