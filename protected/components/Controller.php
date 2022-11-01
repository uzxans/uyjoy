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

class Controller extends CController
{

    public $layout = '//layouts/index';
    public $infoPages = array();
    public $menuTitle;
    public $menu = array();
    public $breadcrumbs = array();
    public $pageKeywords;
    public $pageDescription;
    public $adminTitle = '';
    public $aData;
    public $modelName;
    public $newFields;
    public $seoTitle;
    public $seoDescription;
    public $seoKeywords;

    /* advertising */
    public $advertPos1 = array();
    public $advertPos2 = array();
    public $advertPos3 = array();
    public $advertPos4 = array();
    public $advertPos5 = array();
    public $advertPos6 = array();
    public $apInComparison = array();
    public $assetsGenPath;
    public $assetsGenUrl;
    public $defaultTheme;
    public $baseUrl;
    public $baseThemeUrl;
    public $showSearchForm = true;
    public $htmlPageId = 'inner';
    public $searchShowLabel = false;

    #### start for search
    public $selectedCountry;
    public $selectedRegion;
    public $selectedCity;
    public $selectedMetroStations;
    public $apType;
    public $objType;
    public $roomsCount;
    public $ot; // owner type
    public $wp; // with photo
    public $floorCountMin;
    public $floorCountMax;
    public $squareCountMin;
    public $squareCountMax;
    public $term;
    public $roomsCountMin;
    public $roomsCountMax;
    public $price;
    public $priceSlider = array();
    public $sApId;
    public $landSquare;
    public $bStart;
    public $bEnd;
    public $userListingId;
    #### end for search
    public $currentUserIp;
    public $currentUserIpLong;
    public $datePickerLang;
    public $geo;
    public $privatePolicyPage;
    public $useAdditionalView;
    public $countNewsProduct = 0;

    protected function beforeAction($action)
    {
        if (Yii::app()->request->enableCsrfValidation) {
            Yii::app()->clientScript->registerScript('ajax-csrf', '
				if(typeof jQuery != "undefined"){ 
					$.ajaxPrefilter(function(options, originalOptions, jqXHR){ if(originalOptions.type){ var type = originalOptions.type.toLowerCase(); } else { var type = ""; } if(type == "post" && typeof originalOptions.data === "object"){ options.data = $.extend(originalOptions.data, { "' . Yii::app()->request->csrfTokenName . '": "' . Yii::app()->request->csrfToken . '" }); options.data = $.param(options.data); } }); 
				}
			', CClientScript::POS_END, array());
        }

        if (!Yii::app()->user->checkAccess('backend_access')) {
            $currentController = Yii::app()->controller->id;
            $currentAction = Yii::app()->controller->action->id;

            if (!($currentController == 'site' && ($currentAction == 'login' || $currentAction == 'logout' || $currentAction == 'captcha'))) {
                if (issetModule('service')) {
                    $serviceInfo = Service::model()->findByPk(Service::SERVICE_ID);
                    if ($serviceInfo && $serviceInfo->is_offline == 1) {
                        $allowIps = explode(',', $serviceInfo->allow_ip);
                        $allowIps = array_map("trim", $allowIps);

                        if (!in_array(Yii::app()->request->userHostAddress, $allowIps)) {
                            $this->renderPartial('//modules/service/views/index', array('page' => $serviceInfo->page), false, true);
                            Yii::app()->end();
                        }
                    }
                }
            }
        }

        /* start  get page banners */
        if (issetModule('advertising') && !param('useBootstrap')) {
            $advert = new Advert;
            $advert->getAdvertContent();
        }
        /* end  get page banners */

        $this->checkCookieEnabled();

        if(Yii::app()->request->isAjaxRequest) {
            $this->layout = false;
        }

        return parent::beforeAction($action);
    }

    function init()
    {
        if (!oreInstall::isInstalled() && !(Yii::app()->controller->module && Yii::app()->controller->module->id == 'install')) {
            $this->redirect(array('/install'));
        }

        #Hsite::setSettingTimeZone();
        #Hsite::setSiteTimeZone();

        setLang();
        setCurrency();

        HGeo::init();

        foreach (ConfigurationModel::getModulesList() as $module) {
            $paramValue = param('module_enabled_' . $module);
            if ((!is_string($paramValue) && !is_int($paramValue)) || $paramValue === null) {
                ConfigurationModel::createValue('module_enabled_' . $module, 0);
                Yii::app()->params['module_enabled_' . $module] = 0;
            }
        }

        $this->assetsGenPath = Yii::getPathOfAlias('webroot.assets');
        $this->assetsGenUrl = Yii::app()->getBaseUrl(true) . '/assets/';

        Yii::app()->user->setState('menu_active', '');

        $this->pageTitle = tt('siteName', 'seo');
        $this->pageKeywords = tt('siteKeywords', 'seo');
        $this->pageDescription = tt('siteDescription', 'seo');

        Yii::app()->name = $this->pageTitle;

        $this->defaultTheme = Themes::getDefaultTheme();

        if (!$this->defaultTheme)
            $this->defaultTheme = Themes::THEME_ATLAS_NAME;

        Yii::app()->theme = $this->defaultTheme;

        // добавляем в autoload helpers для темы
        Yii::import('webroot.themes.' . $this->defaultTheme . '.helpers.*');
//        if(Yii::app()->theme->name == Themes::THEME_BASIS_NAME){
//            Yii::app()->params['useBootstrap'] = true;
//        }

        $this->baseUrl = Yii::app()->baseUrl;
        $this->baseThemeUrl = Yii::app()->theme->baseUrl;

        if (in_array(Yii::app()->theme->name, array(Themes::THEME_ATLAS_NAME))) {
            HMenu::setMenuData();
        }

        // comparison list
        if (issetModule('comparisonList')) {
            if (!Yii::app()->user->isGuest) {
                $resultCompare = ComparisonList::model()->findAllByAttributes(
                    array(
                        'user_id' => Yii::app()->user->id,
                    )
                );
            } else {
                $resultCompare = ComparisonList::model()->findAllByAttributes(
                    array(
                        'session_id' => Yii::app()->session->sessionId,
                    )
                );
            }

            if ($resultCompare) {
                foreach ($resultCompare as $item) {
                    $this->apInComparison[] = $item->apartment_id;
                }
            }
        }

        $this->currentUserIp = Yii::app()->request->getUserHostAddress();
        $this->currentUserIpLong = ip2long($this->currentUserIp);

        $this->datePickerLang = Yii::app()->language;
        if ($this->datePickerLang == 'en')
            $this->datePickerLang = 'en-GB';

        if (demo() || isDev()) {
            $template = null;

            if (basicVersion()) {
                $_GET['template'] = Themes::THEME_ATLAS_NAME;
            }

            if (isset($_GET['template']) && array_key_exists($_GET['template'], Themes::getTemplatesList((isDev())))) {
                $template = CHtml::encode($_GET['template']);

                $cookie = new CHttpCookie('template', $template);
                $cookie->expire = time() + 86400;
                Yii::app()->request->cookies['template'] = $cookie;
            }
            if (isset($_GET['theme']) && array_key_exists($_GET['theme'], Themes::getColorThemesList($template))) {
                $theme = CHtml::encode($_GET['theme']);

                $cookie = new CHttpCookie('theme', $theme);
                $cookie->expire = time() + 86400;
                Yii::app()->request->cookies['theme'] = $cookie;
            }
        }

        if (param('useShowInfoUseCookie'))
            $this->privatePolicyPage = InfoPages::model()->cache(param('cachingTime', 86400))->findByPk(InfoPages::PRIVATE_POLICY_PAGE_ID);

        $this->useAdditionalView = Themes::getParam('additional_view');

        if (demo()) {
            if (isset($_GET['additional_view']) && array_key_exists($_GET['additional_view'], Themes::getAdditionalViewList())) {
                $additionalView = (int)$_GET['additional_view'];

                $this->useAdditionalView = $additionalView;

                $cookie = new CHttpCookie('additional_view', $additionalView);
                $cookie->expire = time() + 86400;
                Yii::app()->request->cookies['additional_view'] = $cookie;
            }
        }

        parent::init();
    }

    public static function disableProfiler()
    {
        if (Yii::app()->getComponent('log')) {
            foreach (Yii::app()->getComponent('log')->routes as $route) {
                if (in_array(get_class($route), array('CProfileLogRoute', 'CWebLogRoute', 'YiiDebugToolbarRoute'))) {
                    $route->enabled = false;
                }
            }
        }
    }

    public function createLangUrl($lang = 'en', $params = array())
    {
        $langs = Lang::getActiveLangs();

        if (count($langs) > 1 && issetModule('seo') && isset(SeoFriendlyUrl::$seoLangUrls[$lang])) {
            if (count($params))
                return SeoFriendlyUrl::$seoLangUrls[$lang] . '?' . http_build_query($params);

            return SeoFriendlyUrl::$seoLangUrls[$lang];
        }

        $route = Yii::app()->urlManager->parseUrl(Yii::app()->getRequest());
        $params = array_merge($_GET, $params);
        $params['lang'] = $lang;
        return $this->createUrl('/' . $route, $params);
    }

    public function excludeJs()
    {
        //Yii::app()->clientscript->scriptMap['*.js'] = false;
        Yii::app()->clientscript->scriptMap['jquery.js'] = false;
        Yii::app()->clientscript->scriptMap['jquery.min.js'] = false;
        Yii::app()->clientscript->scriptMap['jquery-ui.min.js'] = false;
        Yii::app()->clientscript->scriptMap['bootstrap.min.js'] = false;
        Yii::app()->clientscript->scriptMap['jquery-ui-i18n.min.js'] = false;
    }

    public static function getCurrentRoute()
    {
        $moduleId = isset(Yii::app()->controller->module) ? Yii::app()->controller->module->id . '/' : '';
        return trim($moduleId . Yii::app()->controller->getId() . '/' . Yii::app()->controller->getAction()->getId());
    }

    public function setSeo(SeoFriendlyUrl $seo)
    {
        $this->seoTitle = $seo->getStrByLang('title');
        if ($page = Yii::app()->request->getParam('page')) {
            $this->seoTitle .= ' - ' . tt('Page', 'service') . ' ' . (int)$page;
        }

        $this->seoDescription = $seo->getStrByLang('description');
        $this->seoKeywords = $seo->getStrByLang('keywords');
    }

    public function actionDeleteVideo($id = null, $apId = null)
    {
        if (Yii::app()->user->isGuest)
            throw404();

        if (!$id && !$apId)
            throw404();

        if (Yii::app()->user->checkAccess('backend_access')) {
            $modelVideo = ApartmentVideo::model()->findByPk($id);
            $modelVideo->delete();

            if (issetModule('historyChanges')) {
                HistoryChanges::addApartmentInfoToHistory('delete_video', (int)$apId, 'delete');
            }

            $this->redirect(array('/apartments/backend/main/update', 'id' => $apId));
        } else {
            $modelApartment = Apartment::model()->findByPk($apId);
            if (!$modelApartment->isOwner()) {
                throw404();
            }

            $modelVideo = ApartmentVideo::model()->findByPk($id);
            $modelVideo->delete();

            if (issetModule('historyChanges')) {
                HistoryChanges::addApartmentInfoToHistory('delete_video', (int)$apId, 'delete');
            }

            $this->redirect(array('/userads/main/update', 'id' => $apId));
        }
    }

    public function actionDeletePanorama($id = null, $apId = null)
    {
        if (Yii::app()->user->isGuest)
            throw404();

        if (!$id && !$apId)
            throw404();

        if (Yii::app()->user->checkAccess('backend_access')) {
            $modelPanorama = ApartmentPanorama::model()->findByPk($id);
            $modelPanorama->delete();

            if (issetModule('historyChanges')) {
                HistoryChanges::addApartmentInfoToHistory('delete_panorama', (int)$apId, 'delete');
            }

            $this->redirect(array('/apartments/backend/main/update', 'id' => $apId));
        } else {
            $modelApartment = Apartment::model()->findByPk($apId);
            if (!$modelApartment->isOwner()) {
                throw404();
            }

            $modelPanorama = ApartmentPanorama::model()->findByPk($id);
            $modelPanorama->delete();

            if (issetModule('historyChanges')) {
                HistoryChanges::addApartmentInfoToHistory('delete_panorama', (int)$apId, 'delete');
            }

            $this->redirect(array('/userads/main/update', 'id' => $apId));
        }
    }

    public static function returnBookingTableStatusHtml($data, $tableId, $onclick = 0, $ignore = 0)
    {
        $statuses = Bookingtable::getAllStatuses();


        $user = HUser::getModel();
        // если это обычный пользователь возвращаем текстовый статус
        if (!in_array($user->role, array(User::ROLE_MODERATOR, User::ROLE_ADMIN)) && $data->active == Bookingtable::STATUS_NEED_PAY) {
            return $statuses[$data->active];
        }

        $statuses = Bookingtable::getAllStatuses(true, true);
        $items = CJavaScript::encode($statuses);

        $options = array(
            'onclick' => 'ajaxSetBookingTableStatus(this, "' . $tableId . '", "' . $data->id . '", "' . $items . '"); return false;',
        );

        return '<div class="center editable_select" id="editable_select-' . $data->id . '">' . CHtml::link($statuses[$data->active], '#', $options) . '</div>';
    }

    public function actionBookingTableActivate()
    {
        $field = isset($_GET['field']) ? $_GET['field'] : 'active';

        if (Yii::app()->request->getParam('id') && (Yii::app()->request->getParam('value') != null)) {
            $this->scenario = 'update_status';
            $action = Yii::app()->request->getParam('value', null);
            $id = Yii::app()->request->getParam('id', null);
            $availableStatuses = Bookingtable::getAllStatuses(true, true);

            if (!array_key_exists($action, $availableStatuses)) {
                $action = 0;
            }
        }

        if (!(!$id && $action === null)) {
            $model = $this->loadModelUserBookingTable($id);

            if ($this->scenario) {
                $model->scenario = $this->scenario;
            }

            if ($model) {
                $oldStatus = $model->$field;

                $model->$field = $action;
                $model->save(false);

                if ($field == 'active' && $oldStatus != $model->$field) {
                    $notifier = new Notifier();
                    if ($model->active == Bookingtable::STATUS_CONFIRM) {
                        $notifier->raiseEvent('onBookingConfirm', $model, array('user' => $model->sender));
                    } elseif (isset($model->apartment->user)) {
                        $notifier->raiseEvent('onBookingChangeStatus', $model, array('user' => $model->apartment->user));
                    }
                }

                if (issetModule('bookingcalendar')) {
                    if ($field == 'active' && $action == Bookingtable::STATUS_CONFIRM) {
                        Bookingcalendar::addRecord($model);
                    }
                }
            }
        }

        echo CHtml::link($availableStatuses[$action]);
    }

    public function loadModelUserBookingTable($id)
    {
        $model = $this->loadModel($id);

        if (!Yii::app()->user->checkAccess('backend_access')) {
            $sql = 'SELECT id FROM {{apartment}} WHERE owner_id = "' . Yii::app()->user->id . '" ';
            $apIds = Yii::app()->db->createCommand($sql)->queryColumn();

            if (!in_array($model->apartment_id, $apIds)) {
                throw404();
            }
        }

        return $model;
    }

    public function setActiveMenu($key, $pos = 'cpanel')
    {
        $this->aData[$pos] = array();
        $this->aData[$pos][$key] = true;
    }

    public function menuIsActive($key, $pos = 'cpanel')
    {
        return isset($this->aData[$pos][$key]) && $this->aData[$pos][$key] === true;
    }

    public function protectEmail($email = null)
    {
        if ($email) {
            $characterSet = '+-.0123456789@ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz';
            $key = str_shuffle($characterSet);
            $cipherText = '';
            $id = 'e' . rand(1, 999999999);

            for ($i = 0; $i < strlen($email); $i += 1) {
                $character = strpos($characterSet, $email[$i]);
                if ($character && isset($key[$character])) {
                    $cipherText .= $key[$character];
                }
            }

            $script = 'var a="' . $key . '";var b=a.split("").sort().join("");var c="' . $cipherText . '";var d="";';
            $script .= 'for(var e=0;e<c.length;e++)d+=b.charAt(a.indexOf(c.charAt(e)));';
            $script .= 'document.getElementById("' . $id . '").innerHTML="<a href=\\"mailto:"+d+"\\">"+d+"</a>"';

            $script = "eval(\"" . str_replace(array("\\", '"'), array("\\\\", '\"'), $script) . "\")";
            $script = '<script type="text/javascript">/*<![CDATA[*/' . $script . '/*]]>*/</script>';

            return '<span class="email" id="' . $id . '">[javascript protected email address]</span>' . $script;
        }
        return false;
    }

    public function checkCookieEnabled()
    {
        $templateNoCookie = $this->renderPartial(
            '//site/cookie-disabled', array(), true
        );

        //$.cookie("test_cookie", "cookie_value", { domain: "'.Yii::app()->request->serverName.'" });
        Yii::app()->clientScript->registerScript('checkCookieEnabled', '
			$.cookie("test_cookie", "cookie_value", {sameSite: "Lax", path: "/"});

			if ($.cookie("test_cookie") != "cookie_value") {
				$.fancybox(
					' . CJavaScript::encode($templateNoCookie) . ',
					{
						"autoDimensions": false,
						"width" : 350,
						"height" :"auto",
						"transitionIn" : "none",
						"transitionOut" : "none",
						"modal" : true
					}
				);
			}
		', CClientScript::POS_READY, array(), true);
    }

    public function actionDeleteDocument($id = null, $apId = null)
    {
        if (Yii::app()->user->isGuest)
            throw404();

        if (Yii::app()->request->isAjaxRequest) {
            $id = (int)Yii::app()->request->getParam('id');

            if ($id) {
                $model = ApartmentDocuments::model()->findByPk($id);

                if ($model) {
                    $apartmentModel = Apartment::model()->findByPk($model->apartment_id);

                    if ($apartmentModel->owner_id == Yii::app()->user->id || Yii::app()->user->checkAccess('backend_access')) {
                        $model->delete();

                        if (issetModule('historyChanges')) {
                            HistoryChanges::addApartmentInfoToHistory('delete_document', $apartmentModel->id, 'delete');
                        }
                    }
                }
            }
        }
    }

    public function actionRenameDocument($id = null, $apId = null)
    {
        if (Yii::app()->user->isGuest)
            throw404();

        $msg = 'no_value';

        if (Yii::app()->request->isAjaxRequest) {
            $pk = (int)Yii::app()->request->getParam('pk');
            $newName = filter_var(Yii::app()->request->getParam('value'), FILTER_SANITIZE_STRING);

            if ($pk && $newName) {
                $model = ApartmentDocuments::model()->findByPk($pk);

                if ($model) {
                    $apartmentModel = Apartment::model()->findByPk($model->apartment_id);

                    if ($apartmentModel->owner_id == Yii::app()->user->id || Yii::app()->user->checkAccess('backend_access')) {
                        if (utf8_strlen($newName) > 200) {
                            $newName = utf8_substr($newName, 0, 200);
                        }

                        $oldName = $model->original_name;
                        $model->original_name = $newName;
                        if ($model->save(false)) {
                            $msg = 'ok';

                            if (issetModule('historyChanges')) {
                                HistoryChanges::addApartmentInfoToHistory('update_document', $apartmentModel->id, 'update', $oldName, $newName);
                            }
                        } else {
                            $msg = 'save_error';
                        }

                        echo CJSON::encode(array('msg' => $msg, 'value' => CHtml::encode($model->original_name), 'pk' => $pk));
                        Yii::app()->end();
                    }
                }
            }
        }
    }

    public function actionDownloadDocument()
    {
        $id = (int)Yii::app()->request->getParam('id');

        if ($id) {
            $model = ApartmentDocuments::model()->findByPk($id);

            if ($model) {
                $filePathDownload = Yii::getPathOfAlias('webroot.uploads.document') . DIRECTORY_SEPARATOR . $model->apartment_id . DIRECTORY_SEPARATOR . $model->modified_name;

                Controller::disableProfiler();
                Yii::app()->request->sendFile($model->original_name, file_get_contents($filePathDownload));
            }
        }
        throw404();
    }
}
