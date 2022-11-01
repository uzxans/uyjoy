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

class ConfigurationModel extends ParentModel
{

    public static function model($className = __CLASS__)
    {
        return parent::model($className);
    }

    public function tableName()
    {
        return '{{configuration}}';
    }

    public function behaviors()
    {
        return array(
            'AutoTimestampBehavior' => array(
                'class' => 'zii.behaviors.CTimestampBehavior',
                'createAttribute' => null,
                'updateAttribute' => 'date_updated',
            ),
        );
    }

    public function rules()
    {
        return array(
            array('name, value', 'settingsValidator'),
            array('name, value', 'length', 'max' => 255),
            array('value, section', 'safe', 'on' => 'search'),
        );
    }

    public function settingsValidator()
    {
        if (!$this->allowEmpty && !$this->value && $this->value !== "0") {
            $this->addError('value', tt('Fill a field'));
        }
    }

    public function getTitle()
    {
        return tt($this->name);
    }

    public function attributeLabels()
    {
        return array(
            'value' => ConfigurationModule::t('Value'),
            'section' => tt('Section'),
        );
    }

    public function search()
    {
        $criteria = new CDbCriteria;

        $criteria->addCondition('type != "hidden"');
        $criteria->compare('value', $this->value);
        $criteria->compare('name', $this->name);

        if (!$this->section && !$this->name) {
            $this->section = 'main';
        }

        if ($this->section != 'all') {
            $criteria->compare('section', $this->section);
        }

        return new CustomActiveDataProvider($this, array(
            'criteria' => $criteria,
            'sort' => array(
                'defaultOrder' => 'section',
            ),
            'pagination' => array(
                'pageSize' => param('adminPaginationPageSizeBig', 60),
            ),
        ));
    }

    public function beforeSave()
    {
        Configuration::clearCache();
        return parent::beforeSave();
    }

    public static function getAdminValue($model)
    {
        if ($model->type == 'bool') {
            $url = Yii::app()->controller->createUrl("activate", array(
                'id' => $model->id,
                'action' => ($model->value == 1 ? 'deactivate' : 'activate'),
            ));
            $img = CHtml::image(
                Yii::app()->theme->baseUrl . '/images/' . ($model->value ? '' : 'in') . 'active.png', Yii::t('common', $model->value ? 'Inactive' : 'Active'), array('title' => Yii::t('common', $model->value ? 'Deactivate' : 'Activate'))
            );

            $options = array(
                'onclick' => 'ajaxSetStatus(this, "config-table"); return false;',
            );

            return '<div align="left">' . CHtml::link($img, $url, $options) . '</div>';
        } elseif ($model->type == 'enum') {
            $list = self::getEnumListForKey($model->name);
            return isset($list[$model->value]) ? $list[$model->value] : mb_substr($model->value, 0, 55);
        } else {
            return mb_substr($model->value, 0, 55);
        }
    }

    public static function getVisible($type)
    {
        return $type == 'text' || $type == 'enum';
    }

    public static function updateValue($key, $value)
    {
        $sql = 'UPDATE {{configuration}} SET value=:value, date_updated=NOW() WHERE name=:name';
        Yii::app()->db->createCommand($sql)->execute(array(
            ':value' => $value,
            ':name' => $key,
        ));

        Configuration::clearCache();
        Yii::app()->cache->flush();
    }

    public static function getEnumListForKey($key)
    {
        $list = array(
            'apartment_periodActivityDefault' => HApartment::getPeriodActivityList(),
            'mode_list_show' => HApartment::getModeShowList(),
            'mailSMTPSecure' => array(
                '' => '',
                'tls' => 'tls',
                'ssl' => 'ssl',
            ),
            'user_registrationMode' => User::getRegistrationModeList(),
            'defaultApartmentType' => HApartment::getTypesArray(),
            'site_timezone' => HSite::getListTimeZonesArr(),
        );
        if (issetModule('geo')) {
            $geoList = array(
                0 => tt('not to expose', 'geo'),
                1 => tt('only the country', 'geo'),
                2 => tt('country and region', 'geo'),
                3 => tt('country, region and city', 'geo'),
            );
            $list['geo_in_search'] = $geoList;
            $list['geo_in_index'] = $geoList;
            $list['geo_in_ad'] = $geoList;
        }

        return isset($list[$key]) ? $list[$key] : array();
    }

    public static function getModulesList()
    {
        return CMap::mergeArray(self::getFreeModules(), self::getProModules());
    }

    public static function getFreeModules()
    {
        return array(
            'apartmentsComplain',
            'similarads',
            'socialauth',
            'comparisonList',
            'rss',
            'articles',
            'reviews',
            'favorite',
        );
    }

    public static function getProModules()
    {
        return array(
            'seo',
            'formeditor',
            'location',
            'rbac',
            'seasonalprices',
            'tariffPlans',
            'bookingcalendar',
            'metroStations',
            'historyChanges',
            'messages',
            'advertising',
            'socialposting',
            'slider',
            'yandexRealty',
            'iecsv',
            'sitemap',
            'geo',
            'api',
        );
    }

    public static function createValue($name, $value, $type = 'hidden', $section = 'main')
    {
        $model = new self;
        $model->type = $type;
        $model->section = $section;
        $model->name = $name;
        $model->value = $value;
        $model->date_updated = date(HSite::$dateFormat);
        $model->save(false);
    }

    public static function clearGenerateJSAssets()
    {
        if (Yii::app()->controller->assetsGenPath) {
            $mask = Yii::app()->controller->assetsGenPath . DIRECTORY_SEPARATOR . 'generate-*';
            @array_map("unlink", glob($mask));

            $mask = Yii::app()->controller->assetsGenPath . DIRECTORY_SEPARATOR . 'rtl-*';
            @array_map("unlink", glob($mask));
        }
    }

    public function getNameWithHint()
    {
        $hint = ConfigurationHelper::getHintForParam($this->name);
        if ($hint) {
            return $this->title . ' <a href="javascript:;" class="btn btn-default btn-xs tempModal" data-original-title="" data-text="' . CHtml::encode($hint) . '"><i class="fa fa-question"></i></a>';
        }

        return $this->title;
    }
}
