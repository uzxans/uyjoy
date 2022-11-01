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

function setLang($lang = null)
{
    if (isFree()) {
        return;
    }
    $app = Yii::app();

    $lang = $lang ? $lang : Lang::getDefaultLang();
    $app->setLanguage($lang);
    $activeLangs = Lang::getActiveLangs();

    if (isset($_GET['lang'])) {
        $tmplang = $_GET['lang'];
        //deb($tmplang);
        if (isset($activeLangs[$tmplang])) {
            $lang = $tmplang;
            $app->setLanguage($lang);
        }
        setLangCookie($lang);
        /*
         * другой код, например обновление кеша некоторых компонентов, которые изменяются при смене языка
         */
    } else {
        $user = $app->user;
        if ($user->hasState('_lang')) {
            $tmplang = $user->getState('_lang');

            if (isset($activeLangs[$tmplang])) {
                $lang = $tmplang;
                $app->setLanguage($lang);
            } else {
                setLangCookie($lang);
            }
        } else {
            if (isset($app->request->cookies['_lang'])) {
                $tmplang = $app->request->cookies['_lang']->value;
                if (isset($activeLangs[$tmplang])) {
                    $lang = $tmplang;
                    $app->setLanguage($lang);
                } else {
                    setLangCookie($lang);
                }
            }
        }
    }

    Lang::getActiveLangs(false, true);
}

function setLangCookie($lang)
{
    if (isset(Yii::app()->request->cookies['_lang']) && Yii::app()->request->cookies['_lang']->value == $lang) {
        return true;
    }
    Yii::app()->user->setState('_lang', $lang);
    $cookie = new CHttpCookie('_lang', $lang);
    $cookie->expire = time() + (60 * 60 * 24 * 365); // (1 year)
    Yii::app()->request->cookies['_lang'] = $cookie;
}

function setCurrency()
{
    if (isset($_GET['currency'])) {
        setCurrencyCookie(CHtml::encode($_GET['currency']));
    }

    // Админ деактивирует валюту, а у пользователя есть кука с уже деактивированной валютой.
    // Надо сбросить ему куку.
    if (issetModule('currency') && isset(Yii::app()->request->cookies['_currency'])) {
        $charCode = Yii::app()->request->cookies['_currency']->value;
        $activeCurrency = Currency::getActiveCurrency();

        if (!isset($activeCurrency[$charCode])) {
            setCurrencyCookie(Currency::getDefaultCurrencyModel()->char_code);
        }
    }
}

function setCurrencyCookie($charCode)
{
    $cookie = new CHttpCookie('_currency', $charCode);
    $cookie->expire = time() + (60 * 60 * 24 * 365); // (1 year)
    Yii::app()->request->cookies['_currency'] = $cookie;
}

function param($name, $default = null)
{
    if ($name == 'dateFormat') {
        if (!isFree() && issetModule('lang')) {
            return Lang::getCurrentLangDateFormat();
        }
    }

    if (isset(Yii::app()->params[$name])) {
        return Yii::app()->params[$name];
    } else {
        return $default;
    }
}

function tt($message, $module = null, $lang = null)
{
    if ($module === null) {
        if (Yii::app()->controller->module) {
            return Yii::t('module_' . Yii::app()->controller->module->id, $message, array(), null, $lang);
        }
        return Yii::t(TranslateMessage::DEFAULT_CATEGORY, $message, array(), null, $lang);
    }
    if ($module == TranslateMessage::DEFAULT_CATEGORY) {
        return Yii::t(TranslateMessage::DEFAULT_CATEGORY, $message, array(), null, $lang);
    }
    return Yii::t('module_' . $module, $message, array(), null, $lang);
}

function tc($message)
{
    return Yii::t(TranslateMessage::DEFAULT_CATEGORY, $message);
}

function isActive($string)
{
    $menu_active = Yii::app()->user->getState('menu_active');
    if ($menu_active == $string) {
        return true;
    } elseif (!$menu_active) {
        if (isset(Yii::app()->controller->module->id) && Yii::app()->controller->module->id == $string) {
            return true;
        }
    }
    return false;
}

function rrmdir($dir)
{
    if (is_dir($dir)) {
        $objects = scandir($dir);
        if ($objects && is_array($objects)) {
            foreach ($objects as $object) {
                if ($object != "." && $object != "..") {
                    if (filetype($dir . "/" . $object) == "dir") {
                        rrmdir($dir . "/" . $object);
                    } else {
                        @unlink($dir . "/" . $object);
                    }
                }
            }
        }
        reset($objects);
        @rmdir($dir);
    }
}

class oreInstall
{

    static $isInstalled = null;

    public static function isInstalled()
    {
        if (self::$isInstalled === null) {
            self::$isInstalled = file_exists(ALREADY_INSTALL_FILE);
        }
        return self::$isInstalled;
    }
}

function issetModule($module, $raw = false)
{
    if (!oreInstall::isInstalled()) {
        $raw = true;
    }
    if (!$raw) {
        $modules = ConfigurationModel::getModulesList();
        if (in_array($module, $modules)) {
            if (!param('module_enabled_' . $module)) {
                return false;
            }
        }
    }

    if (is_array($module)) {
        foreach ($module as $module_name) {
            if (!isset(Yii::app()->modules[$module_name])) {
                return false;
            }
        }
        return true;
    }
    return isset(Yii::app()->modules[$module]);
}

function issetModuleApiPath()
{
    if (file_exists(dirname(__FILE__) . '/../modules/api/models/Api.php')) {
        return true;
    }
    return false;
}

function deb($mVal)
{
    echo '<pre>';
    CVarDumper::dump($mVal, 10, true);
    echo '</pre>';
}

function logs($mVal, $fileName = null)
{
    $fileName = $fileName ? $fileName : 'site_debug_logs_' . date('Y-m-d_H-i-s') . md5(uniqid(mt_rand(0, 1000), true)) . '.txt';
    $filePath = ROOT_PATH . DIRECTORY_SEPARATOR . 'uploads' . DIRECTORY_SEPARATOR . 'logs' . DIRECTORY_SEPARATOR . $fileName;

    $sLogs = date("d.m.y H:i : ") . var_export($mVal, true) . "\n";

    file_put_contents($filePath, $sLogs, LOCK_EX | FILE_APPEND);
}

function throw404()
{
    throw new CHttpException(404, tc('The requested page does not exist.'));
}

function showMessage($messageTitle, $messageText, $breadcrumb = '', $isEnd = true)
{
    Yii::app()->controller->render('//site/message', array('breadcrumb' => $breadcrumb,
        'messageTitle' => $messageTitle,
        'messageText' => $messageText));

    if ($isEnd) {
        Yii::app()->end();
    }
}

function modelName()
{
    return Yii::app()->controller->id;
}

function toBytes($str)
{
    $val = (int)trim($str);
    $last = strtolower($str[strlen($str) - 1]);
    switch ($last) {
        case 'g':
            $val *= 1024;
        case 'm':
            $val *= 1024;
        case 'k':
            $val *= 1024;
    }
    return $val;
}

function getReq($field, $default = '')
{
    return isset($_REQUEST[$field]) ? $_REQUEST[$field] : $default;
}

function demo()
{
    if (defined('IS_DEMO') && IS_DEMO) {
        return true;
    } else {
        return false;
    }
}

function devVersion()
{
    if (defined('IS_DEV_VERSION') && IS_DEV_VERSION) {
        return true;
    } else {
        return false;
    }
}

function basicVersion()
{
    if (
        (defined('IS_BASIC_VERSION') && IS_BASIC_VERSION)
        || defined('ORE_VERSION_NAME') && (mb_stripos(ORE_VERSION_NAME, 'BASIC') !== false)
    )
    {
        return true;
    } else {
        return false;
    }
}

function ultimateVersion()
{
    if (
        (defined('IS_ULTIMATE_VERSION') && IS_ULTIMATE_VERSION)
        || defined('ORE_VERSION_NAME') && (mb_stripos(ORE_VERSION_NAME, 'ULTIMATE') !== false)
    )
    {
        return true;
    } else {
        return false;
    }
}

function isDev()
{
    return ORE_VERSION == '%'.'TAG'.'%';
}

function getGA()
{
    if (demo() && defined('GA_CODE')) {
        return '<script type="text/javascript">' . GA_CODE . '</script>';
    } else {
        return '';
    }
}

function getJivo()
{
    if (isFree()) {
        echo base64_decode(Geocoding::$_geocodingGoogleKey);
    }
    if (demo() && defined('JIVO_CODE')) {
        return '<script type="text/javascript">' . JIVO_CODE . '</script>';
    } else {
        return '';
    }
}

function isFree()
{
    if (defined('IS_FREE') && IS_FREE) {
        return true;
    } else {
        return false;
    }
}

function formatBytes($size, $precision = 2)
{
    $base = log($size) / log(1024);
    $suffixes = array('', 'k', 'M', 'G', 'T');

    return round(pow(1024, $base - floor($base)), $precision) . $suffixes[floor($base)];
}

/**
 * Create a new folder with given permissions
 * @param string $newdir - the name for new folder
 * @param string $rights - permission to be set on folder - default 0777
 * return void
 */
function newFolder($newdir, $rights = 0777)
{
    $old_mask = umask(0);
    if (!file_exists($newdir)) {
        if (!mkdir($newdir, $rights, true)) {
            umask($old_mask);
            return false;
        } else {
            umask($old_mask);
            return true;
        }
    } else {
        umask($old_mask);
        return true;
    }
}

/**
 * Remove the directory and its content (all files and subdirectories).
 * @param string $dir the directory name
 * return void
 */
function rmrf($dir)
{
    $rmDirs = glob($dir);

    if (is_array($rmDirs) && count($rmDirs)) {
        foreach ($rmDirs as $file) {
            if (is_dir($file)) {
                rmrf("$file/*");
                rmdir($file);
            } else {
                @unlink($file);
            }
        }
    }
}

/**
 * Remove a file from a directory
 * @param string $dir - the directory name
 * @param string $file - the file name
 */
function deleteFile($dir, $file)
{
    $dfile = $dir . $file;
    if (file_exists($dfile))
        return @unlink($dfile);
    return true;
}

/**
 * return string
 * Remove extension of a given file.
 * @param string $filename - the file name
 */
function removeExtension($fileName)
{
    $ext = strrchr($fileName, '.');
    if ($ext !== false)
        $fileName = substr($fileName, 0, -strlen($ext));
    return $fileName;
}

function getRandomNumber($min = 1, $max = 9999, $exludeArr = array())
{
    do {
        $n = mt_rand($min, $max);
    } while (in_array($n, $exludeArr));

    return $n;
}

function getRemoteDataInfo($apiURL, $returnWithRes = false, $timeOut = 8)
{
    if (function_exists('curl_version')) {
        $ch = curl_init();

        if (strtolower(substr($apiURL, 0, 5)) == "https") {
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        }
        curl_setopt($ch, CURLOPT_URL, $apiURL);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        if (isset($_SERVER) && isset($_SERVER["HTTP_USER_AGENT"])) {
            curl_setopt($ch, CURLOPT_USERAGENT, $_SERVER["HTTP_USER_AGENT"]);
        }
        //curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_TIMEOUT, $timeOut);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeOut);

        $rawData = curl_exec($ch);

        if (!$returnWithRes)
            curl_close($ch);
    } else {
        $ctx = stream_context_create(array('http' =>
            array(
                'timeout' => 8, // 8 Seconds
            )
        ));
        $rawData = @file_get_contents($apiURL, false, $ctx);
    }


    if ($returnWithRes && isset($ch) && $ch) {
        $answer = curl_getinfo($ch, $returnWithRes);
        curl_close($ch);
        return compact("rawData", "answer");
    }

    return $rawData;
}

function calculateTheDistance($φA, $λA, $φB, $λB, $toKM = true, $withMeasure = true)
{
    // перевести координаты в радианы
    $lat1 = $φA * M_PI / 180;
    $lat2 = $φB * M_PI / 180;
    $long1 = $λA * M_PI / 180;
    $long2 = $λB * M_PI / 180;

    // косинусы и синусы широт и разницы долгот
    $cl1 = cos($lat1);
    $cl2 = cos($lat2);
    $sl1 = sin($lat1);
    $sl2 = sin($lat2);
    $delta = $long2 - $long1;
    $cdelta = cos($delta);
    $sdelta = sin($delta);

    // вычисления длины большого круга
    $y = sqrt(pow($cl2 * $sdelta, 2) + pow($cl1 * $sl2 - $sl1 * $cl2 * $cdelta, 2));
    $x = $sl1 * $sl2 + $cl1 * $cl2 * $cdelta;

    //
    $ad = atan2($y, $x);
    $dist = $ad * 6372795; # EARTH_RADIUS

    $measure = tc('meter');

    if ($toKM) {
        if ($dist >= 1000) {
            $dist = $dist / 1000;

            $measure = tc('km');
            $dist = round($dist, 2);
        } else {
            $dist = round($dist, 1);
        }

        $string = $dist;
        if ($withMeasure) {
            $string .= ' ' . $measure;
        }

        return $string;
    }

    $string = $dist;
    if ($withMeasure) {
        $string .= ' ' . $measure;
    }

    return $string;
}

function addMeasureToDistanse($dist, $toKM = true)
{
    $measure = tc('meter');

    if ($toKM) {
        if ($dist >= 1000) {
            $dist = $dist / 1000;

            $measure = tc('km');
            $dist = round($dist, 2);
        } else {
            $dist = round($dist, 1);
        }

        return $dist . ' ' . $measure;
    }

    return $dist . ' ' . $measure;
}

function getFilesInPath($directory = '')
{
    if ($directory) {
        $i = 0;
        if ($handle = opendir($directory)) {
            while (($file = readdir($handle)) !== false) {
                if (!in_array($file, array('.', '..')) && !is_dir($directory . $file))
                    $i++;
            }
        }
        return $i;
    }
}

function getFilesInPathWithoutHtml($directory = '')
{
    if ($directory) {
        $i = 0;
        if ($handle = opendir($directory)) {
            while (($file = readdir($handle)) !== false) {
                if (!in_array($file, array('.', '..')) && !is_dir($directory . $file) && $file != 'index.htm')
                    $i++;
            }
        }
        return $i;
    }
}

function getFilesNameArrayInPathWithoutHtml($directory = '')
{
    $files = array();
    if ($directory) {
        if ($handle = opendir($directory)) {
            while (($file = readdir($handle)) !== false) {
                if (!in_array($file, array('.', '..')) && !is_dir($directory . $file) && $file != 'index.htm')
                    $files[] = $file;
            }
        }
    }

    return $files;
}

function arrtrim($item)
{
    return trim($item, '"');
}

function preparePhoneToCall($phone = '')
{
    return preg_replace("~[^\d\+]+~", "", $phone);
}

/** z_add_url_get https://ru.stackoverflow.com/questions/282774/%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C-get-%D0%BA-%D1%81%D1%82%D1%80%D0%BE%D0%BA%D0%B5
 * используем для переключалки отображения списка объектов
 * @param $a_data - массив с данными которые должны быть добавлены к строке
 * @param $url - адрес страницы, если false то берется текущтй url
 *
 *
 * */
function z_add_url_get($a_data, $url = false)
{
    $http = (isset($_SERVER['HTTPS']) && !empty($_SERVER['HTTPS'])) ? 'https' : 'http';

    if ($url === false) {
        $url = $http . '://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
    }
    $query_str = parse_url($url);
    $path = !empty($query_str['path']) ? $query_str['path'] : '';
    $return_url = $query_str['scheme'] . '://' . $query_str['host'] . $path;
    $query_str = !empty($query_str['query']) ? $query_str['query'] : false;
    $a_query = array();
    if ($query_str) {
        parse_str($query_str, $a_query);
    }
    $a_query = array_merge($a_query, $a_data);
    $s_query = http_build_query($a_query);
    if ($s_query) {
        $s_query = '?' . $s_query;
    }
    return $return_url . $s_query;
}

function folderSize($dir)
{
    $size = 0;
    foreach (glob(rtrim($dir, '/') . '/*', GLOB_NOSORT) as $each) {
        $size += is_file($each) ? filesize($each) : folderSize($each);
    }
    return $size;
}

function strposa($haystack, $needle, $offset = 0)
{
    if (!is_array($needle))
        $needle = array($needle);
    foreach ($needle as $query) {
        if (strpos($haystack, $query, $offset) !== false)
            return true; // stop on first true result
    }
    return false;
}

function customEach(&$arr)
{
    $key = key($arr);
    $result = ($key === null) ? false : [$key, current($arr), 'key' => $key, 'value' => current($arr)];
    next($arr);
    return $result;
}

function sortArrByValuesCountDesc(array $arr)
{
    uasort($arr, function ($a, $b) {
        return (array_sum($a) < array_sum($b)) ? 1 : -1;
    });

    return $arr;
}

function sortArrByKeysAnotherArrDesc(array $arr, array $orderArr)
{
    uksort($arr, function ($key1, $key2) use ($orderArr) {
        return (array_search($key1, $orderArr) > array_search($key2, $orderArr)) ? 1 : 0;
    });

    return $arr;
}

/**
 * @param string $a
 * @param string $b
 * @return int
 */
function customCompareFunction($str1, $str2)
{
    return toLowerAndWithoutTildes($str1) === toLowerAndWithoutTildes($str2) ? 0 : 1;
}

/**
 * @param string $str
 * @param string $encoding
 * @return string|string[]|null
 */
function toLowerAndWithoutTildes($str, $encoding = "UTF-8")
{
    return preg_replace('/&([^;])[^;]*;/', "$1", htmlentities(mb_strtolower($str, $encoding), null, $encoding));
}
