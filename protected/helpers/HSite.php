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

class HSite
{
    public static $demoShowChangeTemplateCountMax = 3;
    public static $_allTimeZones;
    public static $dateFormatMySql = '%Y-%m-%d %H:%i:%s';
    public static $dateFormat = 'Y-m-d H:i:s';

    public static function registerMainAssets()
    {
        $isRTL = Lang::isRTLLang(Yii::app()->language);

        $cs = Yii::app()->clientScript;
        $cs->coreScriptPosition = CClientScript::POS_BEGIN;

        $cs->defaultScriptFilePosition = CClientScript::POS_BEGIN;
        $cs->defaultScriptPosition = CClientScript::POS_END;

        $baseThemeUrl = Yii::app()->theme->baseUrl;
        $baseThemePath = Yii::app()->theme->basePath;

        $version = (demo()) ? ORE_VERSION : "1.1";

        if (Yii::app()->theme->name == Themes::THEME_ATLAS_NAME) {
            $cs->registerCssFile('https://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700&subset=cyrillic-ext,latin,latin-ext,cyrillic');
        }

        $cs->registerCoreScript('jquery');
        $cs->registerCoreScript('jquery.ui');
        $cs->registerCoreScript('rating');

        $cs->registerScriptFile($cs->getCoreScriptUrl() . '/jui/js/jquery-ui-i18n.min.js', CClientScript::POS_BEGIN); // fix datePicker lang in free
        $cs->registerScriptFile($baseThemeUrl . '/js/sumoselect/jquery.sumoselect.js', CClientScript::POS_BEGIN);
        $cs->registerScriptFile($baseThemeUrl . '/js/jquery.dropdownPlain.js', CClientScript::POS_BEGIN);
        $cs->registerScriptFile($baseThemeUrl . '/js/common.js', CClientScript::POS_BEGIN);
        $cs->registerScriptFile($baseThemeUrl . '/js/habra_alert.js', CClientScript::POS_END);
        $cs->registerScriptFile($baseThemeUrl . '/js/jquery.cookie.js', CClientScript::POS_END);
        $cs->registerScriptFile($baseThemeUrl . '/js/scrollto.js', CClientScript::POS_END);
        $cs->registerScriptFile($baseThemeUrl . '/js/superfish/js/superfish.js', CClientScript::POS_END);

        if ($isRTL) {
            /* self::LTRToRTLCssContent('/css/ui/jquery-ui.multiselect.css');
              self::LTRToRTLCssContent('/css/redmond/jquery-ui-1.7.1.custom.css');
              self::LTRToRTLCssContent('/css/ui.slider.extras.css');
              self::LTRToRTLCssContent('/js/sumoselect/sumoselect.css');
              self::LTRToRTLCssContent('/css/form.css', 'screen');
              self::LTRToRTLCssContent('/js/superfish/css/superfish.css', 'screen'); */
            $cs->registerCssFile($baseThemeUrl . '/css/ui/jquery-ui.multiselect.css');
            $cs->registerCssFile($baseThemeUrl . '/css/redmond/jquery-ui-1.7.1.custom.css');
            $cs->registerCssFile($baseThemeUrl . '/css/ui.slider.extras.css');
            self::LTRToRTLCssContent('/js/sumoselect/sumoselect.css');
            self::LTRToRTLCssContent('/css/form.css', 'screen');
            self::LTRToRTLCssContent('/js/superfish/css/superfish.css', 'screen');
        } else {
            $cs->registerCssFile($baseThemeUrl . '/css/ui/jquery-ui.multiselect.css');
            $cs->registerCssFile($baseThemeUrl . '/css/redmond/jquery-ui-1.7.1.custom.css');
            $cs->registerCssFile($baseThemeUrl . '/css/ui.slider.extras.css');
            $cs->registerCssFile($baseThemeUrl . '/js/sumoselect/sumoselect.css');
            $cs->registerCssFile($baseThemeUrl . '/css/form.css', 'screen');
            $cs->registerCssFile($baseThemeUrl . '/js/superfish/css/superfish.css', 'screen');
        }

        if (Yii::app()->theme->name == Themes::THEME_ATLAS_NAME) {
            if ($isRTL) {
                self::LTRToRTLCssContent('/css/reset.css');
                self::LTRToRTLCssContent('/css/style.css');
                self::LTRToRTLCssContent('/css/media-queries.css');
                $cs->registerCssFile($baseThemeUrl . '/css/rating/rating_rtl.css');
            } else {
                $cs->registerCssFile($baseThemeUrl . '/css/reset.css?v=' . $version);
                $cs->registerCssFile($baseThemeUrl . '/css/style.css?v=' . $version);
                $cs->registerCssFile($baseThemeUrl . '/css/media-queries.css?v=' . $version);
                $cs->registerCssFile($baseThemeUrl . '/css/rating/rating.css');
            }

            $cs->registerCssFile($baseThemeUrl . '/css/style_img.css?v=' . $version);
            $cs->registerCssFile($baseThemeUrl . '/css/media-queries_img.css?v=' . $version);

            if ($isRTL) {
                $cs->registerCssFile($baseThemeUrl . '/css/style_main_rtl.css?v=' . $version);
            }

            $cs->registerScriptFile($baseThemeUrl . '/js/jquery.easing.1.3.js', CClientScript::POS_BEGIN);
            $cs->registerScript('initizlize-superfish-menu', '
				$("#sf-menu-id").superfish( {hoverClass: "sfHover", delay: 100, animationOut: {opacity:"hide"}, animation: {opacity:"show"}, cssArrows: false, dropShadows: false, speed: "fast", speedOut: 1 });
			', CClientScript::POS_READY);
        }

        if (param('useShowInfoUseCookie')) {
            $cs->registerScriptFile(Yii::app()->request->baseUrl . '/common/js/cookiebar/jquery.cookiebar.js', CClientScript::POS_END);
            $cs->registerCssFile(Yii::app()->request->baseUrl . '/common/js/cookiebar/jquery.cookiebar.css');
        }

        if (!empty($colorTheme = Themes::getParam('color_theme'))
            && file_exists($baseThemePath . DIRECTORY_SEPARATOR . 'css' . DIRECTORY_SEPARATOR . 'colors' . DIRECTORY_SEPARATOR . $colorTheme)) {
            $cs->registerCssFile($baseThemeUrl . '/css/colors/' . $colorTheme);
        }

        //$cs->registerScriptFile(Yii::app()->request->baseUrl . '/common/js/browser_fix.js');
    }

    public static function markdown($str)
    {
        $md = new CMarkdownParser;
        // http://htmlpurifier.org/live/configdoc/plain.html
        $md->purifierOptions = array(
            'AutoFormat.AutoParagraph' => true,
            //'AutoFormat.DisplayLinkURI' => true,
            'AutoFormat.Linkify' => true,
        );
        return $md->safeTransform($str);
    }

    public static function setSiteTimeZone()
    {
        /* if (function_exists('date_default_timezone_set') && function_exists('date_default_timezone_get')) {
          $timeZone = @date_default_timezone_get();

          date_default_timezone_set($timeZone);
          Yii::app()->timeZone = $timeZone;
          } */
    }

    public static function setSettingTimeZone()
    {
        /* $settingTimeZone = param('site_timezone');
          if (empty($settingTimeZone) || mb_strlen($settingTimeZone) < 1) {
          if (function_exists('date_default_timezone_set') && function_exists('date_default_timezone_get')) {
          $timeZone = @date_default_timezone_get();
          if ($timeZone) {
          ConfigurationModel::updateValue('site_timezone', $timeZone);
          }
          }
          } */
    }

    public static function getListTimeZonesArr($default = '')
    {
        if (!isset(self::$_allTimeZones)) {
            $unsortedTimezones = DateTimeZone::listIdentifiers();

            self::$_allTimeZones = array();
            foreach ($unsortedTimezones as $timezone) {
                $tz = new DateTimeZone($timezone);
                $dt = new DateTime('now', $tz);
                $offset = $dt->getOffset();
                $current_time = $dt->format(param('dateFormat', 'd.m.Y H:i:s'));
                $offset_string = self::formatTimezoneOffset($offset, true);
                self::$_allTimeZones['UTC' . $offset_string . ' - ' . $timezone] = array(
                    'tz' => $timezone,
                    'offset' => $offset_string,
                    'current' => $current_time,
                    'optgroup' => 'UTC' . $offset_string . ' - ' . $current_time,
                );
            }

            unset($unsortedTimezones);
            uksort(self::$_allTimeZones, array('self', 'timezoneSelectCompare'));

            self::$_allTimeZones = CHtml::listData(self::$_allTimeZones, 'tz', 'tz', 'optgroup');
        }

        return self::$_allTimeZones;
    }

    public static function formatTimezoneOffset($tz_offset, $showNull = false)
    {
        $sign = ($tz_offset < 0) ? '-' : '+';
        $time_offset = abs($tz_offset);

        if ($time_offset == 0 && $showNull == false) {
            return '';
        }

        $offset_seconds = $time_offset % 3600;
        $offset_minutes = $offset_seconds / 60;
        $offset_hours = ($time_offset - $offset_seconds) / 3600;

        $offset_string = sprintf("%s%02d:%02d", $sign, $offset_hours, $offset_minutes);
        return $offset_string;
    }

    public static function timezoneSelectCompare($a, $b)
    {
        $a_sign = $a[3];
        $b_sign = $b[3];
        if ($a_sign != $b_sign) {
            return $a_sign == '-' ? -1 : 1;
        }

        $a_offset = substr($a, 4, 5);
        $b_offset = substr($b, 4, 5);
        if ($a_offset == $b_offset) {
            $a_name = substr($a, 12);
            $b_name = substr($b, 12);
            if ($a_name == $b_name) {
                return 0;
            } else if ($a_name == 'UTC') {
                return -1;
            } else if ($b_name == 'UTC') {
                return 1;
            } else {
                return $a_name < $b_name ? -1 : 1;
            }
        } else {
            if ($a_sign == '-') {
                return $a_offset > $b_offset ? -1 : 1;
            } else {
                return $a_offset < $b_offset ? -1 : 1;
            }
        }
    }

    public static function convertDateToDateWithTimeZone($date = '', $format = 'Y-m-d H:i:s')
    {
        /* if (!empty($date) && !is_null($date)) {
          $timeZone = param('site_timezone');

          if (empty($timeZone) || mb_strlen($timeZone) < 1) {
          $timeZone = 'UTC';
          }

          $dateTime = new DateTime($date);
          $dateTime->setTimezone(new DateTimeZone($timeZone));

          return $dateTime->format($format);
          } */

        return $date;
    }

    public static function convertDateWithTimeZoneToDate($date = '', $format = 'Y-m-d H:i:s')
    {
        /* if (!empty($date) && !is_null($date)) {
          $dateTime = new DateTime($date, new DateTimeZone(param('site_timezone')));
          $dateTime->setTimezone(new DateTimeZone(Yii::app()->timeZone));

          return $dateTime->format($format);
          } */

        return $date;
    }

    public static function createNowDateWithTimeZone($format = 'Y-m-d H:i:s')
    {
        /* $dateTime = new DateTime("now", new DateTimeZone(param('site_timezone')));
          return $dateTime->format($format); */
    }

    public static function getCountPendingForAdmin()
    {
        $additionalCounts = array();

        if (issetModule('payment')) {
            $additionalCounts[] = " (SELECT COUNT(id) FROM {{payments}} WHERE is_show = 0) as countPaymentWait ";
        }
        if (param('allowCustomCities', 0)) {
            if (issetModule('location')) {
                $additionalCounts[] = " (SELECT COUNT(id) FROM {{location_city}} WHERE active=" . City::STATUS_MODERATION . ") as countCitiesModeration ";
            } else {
                $additionalCounts[] = " (SELECT COUNT(id) FROM {{apartment_city}} WHERE active=" . ApartmentCity::STATUS_MODERATION . ") as countCitiesModeration ";
            }
        }
        if (issetModule('comments')) {
            $additionalCounts[] = " (SELECT COUNT(id) FROM {{comments}} WHERE status=" . Comment::STATUS_PENDING . ") as countCommentPending ";
        }
        if (issetModule('apartmentsComplain')) {
            $additionalCounts[] = " (SELECT COUNT(id) FROM {{apartment_complain}} WHERE active=" . ApartmentsComplain::STATUS_PENDING . ") as countComplainPending ";
        }
        if (issetModule('reviews')) {
            $additionalCounts[] = " (SELECT COUNT(id) FROM {{reviews}} WHERE active=" . Reviews::STATUS_INACTIVE . ") as countReviewsPending ";
        }
        if (issetModule('bookingtable')) {
            $additionalCounts[] = " (SELECT COUNT(id) FROM {{booking_table}} WHERE (active = " . Bookingtable::STATUS_NEW . " OR active = " . Bookingtable::STATUS_NEED_PAY . ")) as countNewPending ";
        }
        if (issetModule('messages')) {
            $additionalCounts[] = " (SELECT COUNT(id) FROM {{messages}}
					WHERE is_read=" . Messages::STATUS_UNREAD_USER . "
					AND status = " . Messages::MESSAGE_ACTIVE . "
					AND is_deleted = " . Messages::MESSAGE_NOT_DELETED . "
					AND id_userTo = '" . Yii::app()->user->id . "'
					ORDER BY id) as countMessagesUnread ";
        }

        $newsLang = Yii::app()->language;
        if (!in_array($newsLang, array('ru', 'en'))) {
            $newsLang = 'en';
        }
        $additionalCounts[] = " (SELECT COUNT(id) FROM {{news_product}} WHERE is_show=0 AND lang='{$newsLang}') as countNewsProduct ";

        $additionalCounts[] = " (SELECT COUNT(id) FROM {{apartment}} WHERE price_type IN (" . implode(',', array_keys(HApartment::getPriceArray(Apartment::PRICE_SALE, true))) . ") AND active=" . Apartment::STATUS_MODERATION . ") as countApartmentModeration ";

        $sql = "SELECT 
			(SELECT COUNT(id) FROM {{apartment}} WHERE active=" . Apartment::STATUS_DRAFT . ") as countApartmentDrafts, 
			" . implode(',', $additionalCounts) . " 
		";
        $result = Yii::app()->db->createCommand($sql)->queryRow();

        Yii::app()->controller->countNewsProduct = ($result && isset($result['countNewsProduct'])) ? $result['countNewsProduct'] : 0;

        return $result;
    }

    public static function LTRToRTLCssContent($fileCSSPath, $media = '', $dir = false)
    {
        $baseThemePath = ($dir) ? $dir : Yii::app()->theme->basePath;
        $themeName = Yii::app()->theme->name;

        $fileName = substr($fileCSSPath, strrpos($fileCSSPath, '/') + 1);
        $filePath = str_replace('/', DIRECTORY_SEPARATOR, $fileCSSPath);

        $genFileName = pathinfo($fileName, PATHINFO_FILENAME);
        $genFileNameExt = pathinfo($fileName, PATHINFO_EXTENSION);
        $genFullFileName = 'rtl-' . $themeName . '-' . $genFileName . '.' . $genFileNameExt;

        if (file_exists($baseThemePath . $filePath)) {
            $assetsGenFullFilePath = Yii::app()->controller->assetsGenPath . DIRECTORY_SEPARATOR . $genFullFileName;
            $content = $contentGen = '';

            if (file_exists($baseThemePath)) {
                $content = file_get_contents($baseThemePath . $filePath);
                $content = mb_convert_encoding($content, 'UTF-8', "auto");
            }

            if (file_exists($assetsGenFullFilePath)) {
                $contentGen = file_get_contents($assetsGenFullFilePath);
                $contentGen = mb_convert_encoding($contentGen, 'UTF-8', "auto");
            }

            if (md5($contentGen) != md5($content) || !file_exists($assetsGenFullFilePath)/* || YII_DEBUG*/) {
                if ($content) {
                    Yii::import('ext.php-cssjanus.CSSJanus');
                    $rtlContent = CSSJanus::transform($content);

                    if ($rtlContent) {
                        file_put_contents($assetsGenFullFilePath, $rtlContent, LOCK_EX);
                    }
                }
            }

            if (file_exists($assetsGenFullFilePath)) {
                Yii::app()->clientScript->registerCssFile(Yii::app()->controller->assetsGenUrl . $genFullFileName, $media);
            }
        }
    }

    public static function buttonGroupList($list, $field, $select)
    {
        $htm = '';
        $htm .= '<div class="btn-group">';
        foreach ($list as $id => $name) {
            $class = $id == $select ? ' active' : '';
            $htm .= '<button type="button" onclick="$(\'#' . $field . '-btn\').val(' . $id . ');" class="btn btn-primary' . $class . '">' . $name . '</button>';
        }
        $htm .= '</div>';

        $htm .= CHtml::hiddenField($field, $select, array('id' => $field . '-btn'));

        return $htm;
    }

    public static function parseText($text)
    {
        if (issetModule('slider')) {
            $text = Carousel::parseText($text);
        }

        if (issetModule('customHtml')) {
            Yii::import('application.modules.customHtml.models.*');
            $text = CustomHtml::parseText($text);
        }

        if(param('convertYoutubeLink', 1)){
            $text = convertYoutube($text);
        }

        return $text;
    }

    public static function allowUploadAndResizeImage($imagePath = '')
    {
        $return = array(
            'result' => false,
            'memoryImageNeeded' => 0,
            'memoryImageNeededInMB' => 0,
            'memoryLimit' => 0,
            'memoryLimitInMB' => 0,
        );

        if ($imagePath && file_exists($imagePath)) {
            $allowedExtensions = param('allowedImgExtensions', array('jpg', 'jpeg', 'gif', 'png'));
            $allowMimeTypes = param('allowedImgMimeTypes', array('image/gif', 'image/jpeg', 'image/png'));

            $pathInfo = pathinfo($imagePath);
            if (!in_array(strtolower($pathInfo['extension']), $allowedExtensions)) {
                return $return;
            }

            $fileInfo = (function_exists('finfo_open')) ? finfo_open(FILEINFO_MIME_TYPE) : null;
            if ($fileInfo && !in_array(finfo_file($fileInfo, $imagePath), $allowMimeTypes)) {
                return $return;
            }

            $imageInfo = @getimagesize($imagePath);

            if (is_array($imageInfo) && !empty($imageInfo)) {
                $memoryLimit = ini_get('memory_limit');
                $memoryLimit = toBytes($memoryLimit);

                $currentMemoryUsage = (function_exists('memory_get_usage') && memory_get_usage()) ? memory_get_usage() : 0;

                $imageInfo['bits'] = $imageInfo['bits'] ?? 8;
                $imageInfo['channels'] = $imageInfo['channels'] ?? 3;

                $memoryImageNeeded = round(($imageInfo[0] * $imageInfo[1] * $imageInfo['bits'] * $imageInfo['channels'] / 8 + pow(2, 16)) * 1.65);
                $memoryImageNeeded = $memoryImageNeeded * 2; # two image

                $memoryImageNeeded = $memoryImageNeeded + $currentMemoryUsage;

                $return['memoryImageNeeded'] = $memoryImageNeeded;
                $return['memoryImageNeededInMB'] = round($memoryImageNeeded / (1024 * 1024));
                $return['memoryLimit'] = $memoryLimit;
                $return['memoryLimitInMB'] = round($memoryLimit / (1024 * 1024));

                if ($memoryLimit > $memoryImageNeeded) {
                    $return['result'] = true;
                }
            }
        }

        return $return;
    }

    public static function setCanonicalTag(array $params = [])
    {
        $url = Yii::app()->getBaseUrl(true) . '/' . Yii::app()->request->getPathInfo();

        if (!empty($params)) {
            $url .= '?' . http_build_query($params);
        }

        Yii::app()->clientScript->registerLinkTag('canonical', null, $url);
    }

    public static function setCanonicalTagForIndex()
    {
        $canonicalUrl = rtrim(Yii::app()->createAbsoluteUrl('/'), '/');
        if (substr_compare( $canonicalUrl, Yii::app()->request->url, -strlen( Yii::app()->request->url )) === 0) {
            Yii::app()->clientScript->registerLinkTag('canonical', null, $canonicalUrl);
        }
    }

    /**
     * @param bool $showSorter
     * @return mixed
     */
    public static function getBaseSwitchUrl(bool $showSorter = true)
    {
        $getForSwitch = $_GET;
        unset($getForSwitch['url'], $getForSwitch['lang'], $getForSwitch['cityUrlName'], $getForSwitch['objTypeUrlName']);

        if (!$showSorter) {
            unset($getForSwitch['sort']);
        }

        return $getForSwitch;
    }

    /**
     * @param Apartment $apartment
     * @return bool
     */
    public static function availableApartmentPaidServices(Apartment $apartment)
    {
        return ((issetModule('paidservices')) && $apartment->isActive());
    }
}
