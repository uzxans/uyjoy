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

class SiteController extends Controller
{

    public $cityActive;
    public $newFields;

    public function actions()
    {
        $return = array();
        if (param('useJQuerySimpleCaptcha', 0)) {
            $return['captcha'] = array(
                'class' => 'jQuerySimpleCCaptchaAction',
                'backColor' => 0xFFFFFF,
            );
        } else {
            $return['captcha'] = array(
                'class' => 'MathCCaptchaAction',
                'backColor' => 0xFFFFFF,
            );
        }

        return $return;
    }

    public function filters()
    {
        return array(
            'accessControl', // perform access control for CRUD operations
            array(
                'ESetReturnUrlFilter + index',
            ),
            array(
                'application.filters.html.ECompressHtmlFilter',
                'gzip' => false, /* (YII_DEBUG ? false : true), */
                'doStripNewlines' => false,
                'actions' => '*'
            ),
        );
    }

    public function accessRules()
    {
        return array(
            array('allow',
                'users' => array('*'),
            ),
            array('allow',
                'actions' => array('viewreferences'),
                'expression' => 'Yii::app()->user->checkAccess("backend_access")',
            ),
        );
    }

    public function init()
    {
        parent::init();
        $this->cityActive = SearchForm::cityInit();
    }

    public function actionIndex()
    {
        $this->htmlPageId = 'index';

        $page = InfoPages::model()->scopeActive()->findByPk(InfoPages::MAIN_PAGE_ID);

        if (issetModule('seo')) {
            $seo = SeoFriendlyUrl::model()->findByAttributes(array('model_name' => 'InfoPages', 'model_id' => InfoPages::MAIN_PAGE_ID));
            if ($seo)
                $this->setSeo($seo);
        }

        HSite::setCanonicalTagForIndex();

        Yii::app()->user->setState('searchUrl', NULL);

        if (Yii::app()->request->isAjaxRequest) {
            $this->renderPartial('index', array('page' => $page));
        } else {
            $this->render('index', array('page' => $page));
        }
    }

    public function actionError()
    {
        if (demo()) {
            $defaultLang = Lang::getDefaultLang();
            if ($defaultLang == Yii::app()->request->getPathInfo() && $defaultLang) {
                $this->redirect(array('/site/index'));
            }
        }

        $this->layout = '//layouts/inner';
        $error = Yii::app()->errorHandler->error;

        if (Yii::app()->request->isAjaxRequest) {
            if (is_array($error))
                Yii::app()->displayError($error['code'], $error['message'], $error['file'], $error['line']);
        } elseif (YII_DEBUG)
            $this->render('exception', $error);
        else
            $this->render('error', $error);

        /*
          if ($error = Yii::app()->errorHandler->error) {
          if (Yii::app()->request->isAjaxRequest)
          echo $error['message'];
          else {
          $this->render('error', $error);
          }
          } */
    }

    public function actionLogin()
    {
        $this->layout = '//layouts/inner';
        $this->showSearchForm = false;

        $model = new LoginForm;

        if (Yii::app()->request->getQuery('soc_error_save')) {
            Yii::app()->user->setFlash('error', tc('Error. Repeat attempt later'));
        }
        if (Yii::app()->request->getQuery('deactivate')) {
            showMessage(tc('Login'), tt('Your account not active. Administrator deactivate your account.', 'socialauth'), null, true);
        }

        $service = Yii::app()->request->getQuery('service');
        if (isset($service)) {
            $authIdentity = Yii::app()->eauth->getIdentity($service);
            $authIdentity->redirectUrl = Yii::app()->user->returnUrl;
            $authIdentity->cancelUrl = $this->createAbsoluteUrl('site/login');

            if ($authIdentity->authenticate()) {
                $identity = new EAuthUserIdentity($authIdentity);

                // успешная авторизация
                if ($identity->authenticate()) {
                    //Yii::app()->user->login($identity);

                    $uid = $identity->id;
                    $firstName = $identity->firstName;
                    $email = $identity->email;
                    $service = $identity->serviceName;
                    $mobilePhone = $identity->mobilePhone;
                    $homePhone = $identity->homePhone;
                    $isNewUser = false;

                    $existId = User::getIdByUid($uid, $service);

                    if (!$existId) {
                        $isNewUser = true;
                        $email = (!$email) ? User::getRandomEmail() : $email;
                        $phone = '';
                        if ($mobilePhone)
                            $phone = $mobilePhone;
                        elseif ($homePhone)
                            $phone = $homePhone;

                        if ($phone && mb_strlen($phone) > 20)
                            $phone = mb_substr($phone, 0, 20);

                        $user = User::createUser(array('email' => $email, 'phone' => $phone, 'username' => $firstName), true);

                        if (!$user || !isset($user['id'])) {
                            $authIdentity->redirect(Yii::app()->createAbsoluteUrl('/site/login') . '?soc_error_save=1');
                        }

                        $success = User::setSocialUid($user['id'], $uid, $service);

                        if (!$success) {
                            User::model()->findByPk($user['id'])->delete();
                            $authIdentity->redirect(Yii::app()->createAbsoluteUrl('/site/login') . '?soc_error_save=1');
                        }

                        $existId = User::getIdByUid($uid, $service);
                    }

                    if ($existId) {
                        $result = $model->loginById($existId);

                        User::updateUserSession();
                        User::updateLatestInfo(Yii::app()->user->id, Yii::app()->controller->currentUserIp);

                        if ($result) {
                            //						Yii::app()->user->clearState('id');
                            //						Yii::app()->user->clearState('first_name');
                            //						Yii::app()->user->clearState('nickname');
                            if ($result === 'deactivate')
                                $authIdentity->redirect(Yii::app()->createAbsoluteUrl('/site/login') . '?deactivate=1');
                            if ($isNewUser)
                                $authIdentity->redirect(Yii::app()->createAbsoluteUrl('/usercpanel/main/index') . '?soc_success=1');
                            else
                                $authIdentity->redirect(Yii::app()->createAbsoluteUrl('/usercpanel/main/index'));
                        }
                    }
                    // специальное перенаправления для корректного закрытия всплывающего окна
                    $authIdentity->redirect();
                } else {
                    // закрытие всплывающего окна и перенаправление на cancelUrl
                    $authIdentity->cancel();
                }
            }

            // авторизация не удалась, перенаправляем на страницу входа
            $this->redirect(array('site/login'));
        }

        if (Yii::app()->user->getState('attempts-login') >= LoginForm::ATTEMPTSLOGIN) {
            $model->scenario = 'withCaptcha';
        }

        if (isset($_POST['ajax']) && $_POST['ajax'] === 'login-form') {
            echo CActiveForm::validate($model);
            Yii::app()->end();
        }

        if (!Yii::app()->user->isGuest) {
            $this->redirect(array('/usercpanel/main/index'));
        }

        if (isset($_POST['LoginForm'])) {
            $model->attributes = $_POST['LoginForm'];
            $model->allowLoginAction = false;

            if ($model->validate() && $model->login()) {
                if (param('useLoginAdminSendEmailCode') && Yii::app()->user->getState('isAdmin')) {
                    $loginCodeModel = new LoginCodeForm;

                    if ($loginCodeModel->sendCode()) {
                        $this->render('login_code', array('model' => $loginCodeModel));
                    } else {
                        showMessage(tc('Login'), tc('The confirmation code was not sent to Email. Please try again later.'), null, true);
                    }
                } else {
                    $model->allowLoginAction = true;
                    $model->login();
                    $model->afterLogin();
                }

                Yii::app()->end();
            }

            Yii::app()->user->setState('attempts-login', Yii::app()->user->getState('attempts-login', 0) + 1);
            if (Yii::app()->user->getState('attempts-login') >= LoginForm::ATTEMPTSLOGIN) {
                $model->scenario = 'withCaptcha';
            }
        }
        $this->render('login', array('model' => $model));
    }

    public function actionLoginCode()
    {
        $this->layout = '//layouts/inner';
        $this->showSearchForm = false;

        if (!Yii::app()->user->isGuest || !Yii::app()->user->getState('isAdmin')) {
            $this->redirect(array('/usercpanel/main/index'));
        }

        if (!Yii::app()->user->getState('userLoginId')) {
            throw404();
        }

        $model = new LoginCodeForm;
        if (isset($_POST['LoginCodeForm'])) {
            $model->attributes = $_POST['LoginCodeForm'];
            if ($model->validate()) {
                $userLoginId = (int) Yii::app()->user->getState('userLoginId');

                $model->clearCode();

                $modelLogin = new LoginForm;
                $result = $modelLogin->loginById($userLoginId);

                if ($result) {
                    $modelLogin->afterLogin();
                } else {
                    showMessage(tc('Login'), tc('Произошла ошибка входа. Повторите попытку позднее.'), null, true);
                }

                Yii::app()->end();
            }
        }
        $this->render('login_code', array('model' => $model));
    }

    public function actionLogout()
    {
        Yii::app()->user->logout();

        if (isset(Yii::app()->request->cookies['itemsSelectedImport']))
            unset(Yii::app()->request->cookies['itemsSelectedImport']);

        if (isset(Yii::app()->request->cookies['itemsSelectedExport']))
            unset(Yii::app()->request->cookies['itemsSelectedExport']);

        if (isset(Yii::app()->session['importAds']))
            unset(Yii::app()->session['importAds']);

        $this->redirect(Yii::app()->controller->createAbsoluteUrl('/'));
    }

    public function actionViewreferences()
    {
        $this->layout = '//layouts/admin';
        $this->render('view_reference');
    }

    public function actionRecover()
    {
        $this->layout = '//layouts/inner';
        $this->showSearchForm = false;

        $modelRecover = new RecoverForm;

        $key = Yii::app()->request->getParam('key');
        if ($key) {
            $user = User::model()->find('recoverPasswordKey = :key', array(':key' => $key));
            if ($user) {
                $password = $user->temprecoverpassword;

                // set salt pass
                $user->setPassword($password);
                $user->temprecoverpassword = $user->recoverPasswordKey = '';

                // set new password in db
                $user->update(array('password', 'salt', 'temprecoverpassword', 'recoverPasswordKey'));

                showMessage(tc('Recover password'), tc('Password successfully changed'));
            } else
                throw new CHttpException(403, tc('User not exists'));
        } else {
            if (isset($_POST['ajax']) && $_POST['ajax'] === 'recover-form') {
                echo CActiveForm::validate($modelRecover);
                Yii::app()->end();
            }

            if (isset($_POST['RecoverForm'])) {
                $modelRecover->attributes = $_POST['RecoverForm'];

                if ($modelRecover->validate()) {
                    $model = User::model()->findByAttributes(array('email' => $modelRecover->email));

                    if ($model !== null) {

                        if (demo()) {
                            Yii::app()->user->setFlash('notice', tc('Sorry, this action is not allowed on the demo server.'));
                            $this->refresh();
                        }

                        $tempRecoverPassword = $model->randomString();
                        $recoverPasswordKey = User::generateActivateKey();

                        $model->temprecoverpassword = $tempRecoverPassword;
                        $model->recoverPasswordKey = $recoverPasswordKey;
                        $model->update(array('temprecoverpassword', 'recoverPasswordKey'));

                        $model->recoverPasswordLink = Yii::app()->createAbsoluteUrl('/site/recover', array('key' => $recoverPasswordKey, 'lang' => Yii::app()->language));

                        // send email
                        $notifier = new Notifier;
                        $notifier->raiseEvent('onRecoveryPassword', $model, array('user' => $model));

                        showMessage(tc('Recover password'), tc('recover_pass_temp_send'));
                    } else {
                        showMessage(tc('Recover password'), tc('User does not exist'));
                    }
                } else {
                    $modelRecover->unsetAttributes(array('verifyCode'));
                }
            }
        }
        $this->render('recover', array('model' => $modelRecover));
    }

    public function actionRegister()
    {
        if (!param('useUserRegistration', 0))
            throw404();

        $this->showSearchForm = false;
        $this->layout = '//layouts/inner';

        if (Yii::app()->user->isGuest) {
            if (param('user_registrationMode') == 'without_confirm')
                $model = new User('register_without_confirm');
            else
                $model = new User('register');

            if (isset($_POST['User']) && BlockIp::checkAllowIp(Yii::app()->controller->currentUserIpLong)) {
                $model->attributes = $_POST['User'];
                if ($model->validate()) {
                    $model->activatekey = User::generateActivateKey();
                    $user = User::createUser($model->attributes);

                    if ($user) {
                        $model->id = $user['id'];
                        $model->password = $user['password'];
                        $model->email = $user['email'];
                        $model->username = $user['username'];
                        $model->activatekey = $user['activatekey'];
                        $model->activateLink = $user['activateLink'];

                        $notifier = new Notifier;
                        $notifier->raiseEvent('onNewUser_' . param('user_registrationMode'), $model, array('user' => $user['userModel']));

                        if (param('user_registrationMode') == 'without_confirm') {

                            if ($user['userModel']->type == User::TYPE_AGENT && $user['userModel']->agency_user_id) {
                                $agency = User::model()->findByPk($user['userModel']->agency_user_id);

                                if ($agency) {
                                    $notifier = new Notifier();
                                    $notifier->raiseEvent('onNewAgent', $user['userModel'], array(
                                        'forceEmail' => $agency->email,
                                    ));
                                }
                            }

                            $login = new LoginForm;
                            $login->setAttributes(array('username' => $user['email'], 'password' => $user['password']));

                            if ($login->validate() && $login->login()) {
                                User::updateUserSession();
                                User::updateLatestInfo(Yii::app()->user->id, Yii::app()->controller->currentUserIp);

                                $this->redirect(array('/usercpanel/main/index'));
                            } else {
                                /* echo 'getErrors=<pre>';
                                  print_r($login->getErrors());
                                  echo '</pre>';
                                  exit; */
                                showMessage(Yii::t('common', 'Registration'), Yii::t('common', 'You were successfully registered.'));
                            }
                        } else {
                            showMessage(Yii::t('common', 'Registration'), Yii::t('common', 'You were successfully registered. The letter for account activation has been sent on {useremail}', array('{useremail}' => $user['email'])));
                        }
                    } else {
                        showMessage(Yii::t('common', 'Registration'), Yii::t('common', 'Error. Repeat attempt later'));
                    }
                } else {
                    $model->unsetAttributes(array('verifyCode'));
                }
            }
            $this->render('register', array('model' => $model));
        } else {
            //$this->redirect(array('index'));
            $this->redirect(array('/usercpanel/main/index'));
        }
    }

    public function actionActivation()
    {
        $this->layout = '//layouts/inner';
        $this->showSearchForm = false;

        $key = Yii::app()->request->getParam('key');
        if ($key) {
            $user = User::model()->find('activatekey = :activatekey', array(':activatekey' => $key));

            if (!empty($user)) {
                if ($user->active == '1') {
                    showMessage(Yii::t('common', 'Activate account'), Yii::t('common', 'Your status account already is active'));
                } else {
                    $user->active = '1';
                    $user->activatekey = '';

                    $user->update(array('active', 'activatekey'));

                    if ($user->type == User::TYPE_AGENT && $user->agency_user_id) {
                        $agency = User::model()->findByPk($user->agency_user_id);

                        if ($agency) {
                            $notifier = new Notifier();
                            $notifier->raiseEvent('onNewAgent', $user, array(
                                'forceEmail' => $agency->email,
                            ));
                        }
                    }

                    showMessage(Yii::t('common', 'Activate account'), Yii::t('common', 'Your account successfully activated'));
                }
            } else {
                throw new CHttpException(403, Yii::t('common', 'User not exists'));
            }
        } else {
            $this->redirect(array('/site/index'));
        }
    }

    public function actionCallback()
    {
        $this->layout = '//layouts/inner';
        $isAjax = Yii::app()->request->isAjaxRequest;

        $model = new CallForm;
        if (isset($_POST['CallForm'])) {
            $model->attributes = $_POST['CallForm'];
            if ($model->validate()) {
                $notifier = new Notifier;
                $notifier->raiseEvent('onNewCallBackForm', $model);

                Yii::app()->user->setFlash('success', tc('Thanks! Our staff will call you back as soon as possible'));
                $this->refresh();
            }
        }

        $data = array('model' => $model, 'isAjax' => $isAjax);

        if ($isAjax) {
            $this->excludeJs();
            $this->renderPartial('callback', $data, false, true);
        } else {
            $this->render('callback', $data);
        }
    }

    public function actionVersion()
    {
        echo ORE_VERSION_NAME . ' ' . ORE_VERSION;
    }

    public function actionGetMarkersViewAllMap()
    {
        Yii::import('application.modules.viewallonmap.components.ViewallonmapWidget');

        $return = $markers = array();
        $return['needZoom'] = false;

        if (!isset($_POST['southWest']) || !isset($_POST['northEast']) ||
            !isset($_POST['southWest']['lat']) || !isset($_POST['northEast']['lat']) ||
            !isset($_POST['southWest']['lng']) || !isset($_POST['northEast']['lng'])
        ) {
            return CJSON::encode(array('needZoom' => false, 'markers' => array()));
        }

        $useYMap = param('useYandexMap', 1);
        $useGMap = param('useGoogleMap', 1);
        $useOSMap = param('useOSMMap', 1);

        $a = (float)$_POST['southWest']['lat'];
        $b = (float)$_POST['southWest']['lng'];
        $c = (float)$_POST['northEast']['lat'];
        $d = (float)$_POST['northEast']['lng'];

        $condition1 = $a < $c ? "lat BETWEEN $a AND $c" : "lat BETWEEN $c AND $a";
        $condition2 = $b < $d ? "lng BETWEEN $b AND $d" : "lng BETWEEN $d AND $b";

        $addCondition = " AND (( $condition1 ) AND ( $condition2 )) ";

        if (isset($_POST['get'])) {
            $_GET = $_POST['get'];
        }

        $apartments = ViewallonmapWidget::getViewAllMapApartments($addCondition, ViewallonmapWidget::MAX_RESULT);
        $count = count($apartments);

        if ($count >= ViewallonmapWidget::MAX_RESULT) {
            $return['needZoom'] = true;
        }

        $return['count'] = $count;
        if (!empty($apartments)) {
            $apartments = array_slice($apartments, 0, ViewallonmapWidget::MAX_RESULT, true);

            foreach ($apartments as $apartment) {
                if ($useYMap) {
                    $markers[] = CustomYMap::init()->addMarker($apartment['lat'], $apartment['lng'], null, 1, $apartment, true);
                } elseif ($useGMap) {
                    $markers[] = CustomGMap::addMarker($apartment, null, 'false', true);
                } elseif ($useOSMap) {
                    $markers[] = CustomOSMap::addMarker($apartment, null, 'false', true);
                }
            }
        }
        $return['markers'] = $markers;

        // echo json_encode($return, JSON_UNESCAPED_SLASHES);
        echo CJSON::encode($return);
        Yii::app()->end();
    }

    public function actionRemoveImportedListings()
    {
        exit;

        $criteria = new CDbCriteria;
        $criteria->addCondition('char_length(parse_internal_id) > 0');

        $result = Apartment::model()->findAll($criteria);

        if (!empty($result)) {
            foreach ($result as $ad) {
                if (!$ad->delete()) {
                    var_dump('false');
                }
            }
        }

        echo 'job done, sir';
        exit;
    }

    public function actionStartManualImportListings()
    {
        exit;

        if (issetModule('yandexRealty')) {
            //ini_set("max_execution_time", 7200);
            //ini_set("memory_limit", "1536M");

            $yandexRealtyImport = new YandexRealtyImport();
            $yandexRealtyImport->updateDataFromRemoteFile();
            $yandexRealtyImport->updateListings();

            echo 'job done, sir';
            exit;
        }
    }

}
