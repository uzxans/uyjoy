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

/**
 * This is the model class for table "{{formdesigner}}".
 *
 * The followings are the available columns in table '{{formdesigner}}':
 * @property integer $id
 * @property string $field
 * @property integer $is_i18n
 * @property integer $visible
 */
class FormDesigner extends ParentModel
{

    // новое добавленное поле
    const STANDARD_TYPE_NEW = 0;
    // поле пристутвует изначально
    const STANDARD_TYPE_ORIGINAL = 1;
    // поле пристутвует изначально и имеет свое отображение protected/views/common/apartments/backend/fields/*
    const STANDARD_TYPE_ORIGINAL_VIEW = 2;
    // тип поля
    const TYPE_DEFAULT = 0;
    const TYPE_REFERENCE = 1;
    const TYPE_TEXT = 2;
    const TYPE_TEXT_AREA = 3;
    const TYPE_TEXT_AREA_WS = 4;
    const TYPE_INT = 5;
    const TYPE_FLOAT = 6;
    const TYPE_MULTY = 7;
    const TYPE_RANGE = 8;
    const RULE_NO_REQUIRED = 0;
    const RULE_REQUIRED = 1;
    const RULE_REQUIRED_NUMERICAL = 2;
    const RULE_NUMERICAL = 3;
    const RULE_REQUIRED_NUMERICAL_FULL = 4;
    const VIEW_IN_GENERAL = 1;
    const VIEW_IN_EXTENDED = 2;

    public $type;
    public $name;
    private static $_listByCategoryID;

    const VISIBLE_ALL = 0;
    const VISIBLE_REGISTERED = 1;
    const VISIBLE_OWNER_OR_ADMIN = 2;
    const VISIBLE_ADMIN = 3;
    const COMPARE_EQUAL = 0;
    const COMPARE_LIKE = 1;
    const COMPARE_FROM = 2;
    const COMPARE_TO = 3;
    const COMPARE_FROM_TO = 4;

    public $minSorter = 0;
    public $maxSorter = 0;
    public $saveObjTypes = array();
    public $saveApTypes = array();

    public static function getCompareList($val = null)
    {
        $arr = array(
            self::COMPARE_EQUAL => tt('compare equal', 'formeditor'),
            self::COMPARE_LIKE => tt('compare like', 'formeditor'),
            self::COMPARE_FROM => tt('compare from', 'formeditor'),
            self::COMPARE_TO => tt('compare to', 'formeditor'),
            self::COMPARE_FROM_TO => tt('compare from to', 'formeditor'),
        );

        if (is_numeric($val) && array_key_exists($val, $arr))
            return $arr[$val];

        return $arr;
    }

    public static function getTypesList()
    {
        return array(
            self::TYPE_REFERENCE => tt('type reference', 'formeditor'),
            self::TYPE_INT => tt('type INT', 'formeditor'),
            self::TYPE_TEXT => tt('type text', 'formeditor'),
            self::TYPE_TEXT_AREA => tt('type text area', 'formeditor'),
            self::TYPE_TEXT_AREA_WS => tt('type text area with wysiwyg', 'formeditor'),
            self::TYPE_MULTY => tt('type multyselect', 'formeditor'),
            self::TYPE_RANGE => tt('type range', 'formeditor'),
            //self::TYPE_FLOAT => tt('type FLOAT', 'formeditor'),
        );
    }

    public static function getVisibleList()
    {
        return array(
            self::VISIBLE_ALL => tt('Visible to all', 'formeditor'),
            self::VISIBLE_REGISTERED => tt('Visible for registered', 'formeditor'),
            self::VISIBLE_OWNER_OR_ADMIN => tt('Visible for owner or admin', 'formeditor'),
            self::VISIBLE_ADMIN => tt('Visible for admin', 'formeditor'),
        );
    }

    public function getVisibleName()
    {
        $list = self::getVisibleList();
        return isset($list[$this->visible]) ? $list[$this->visible] : '?';
    }

    public function getTypeName()
    {
        $list = self::getTypesList();
        return isset($list[$this->type]) ? $list[$this->type] : '?';
    }

    public static function getRulesList($val = null)
    {
        $arr = array(
            self::RULE_NO_REQUIRED => tt('value no required'),
            self::RULE_REQUIRED => tt('value required'),
            self::RULE_REQUIRED_NUMERICAL => tt('value required and must be numerical'),
            self::RULE_NUMERICAL => tt('value must be numerical'),
            self::RULE_REQUIRED_NUMERICAL_FULL => tt('both values are required and must be numerical')
        );

        if (is_numeric($val) && array_key_exists($val, $arr))
            return $arr[$val];

        return $arr;
    }

    public static function getViewInList()
    {
        return array(
            self::VIEW_IN_GENERAL => tt('Display in general.', 'formeditor'),
            self::VIEW_IN_EXTENDED => tt('Display in extended.', 'formeditor'),
        );
    }

    public function getViewInName()
    {
        $list = self::getViewInList();
        return isset($list[$this->view_in]) ? $list[$this->view_in] : '?';
    }

    public function behaviors()
    {
        return array(
            'AutoTimestampBehavior' => array(
                'class' => 'zii.behaviors.CTimestampBehavior',
                'createAttribute' => NULL,
                'updateAttribute' => 'date_updated',
            ),
            'JsonBehavior' => array(
                'class' => 'application.components.behaviors.JsonBehavior',
            ),
        );
    }

    /**
     * Returns the static model of the specified AR class.
     * @param string $className active record class name.
     * @return FormDesigner the static model class
     */
    public static function model($className = __CLASS__)
    {
        return parent::model($className);
    }

    /**
     * @return string the associated database table name
     */
    public function tableName()
    {
        return '{{formdesigner}}';
    }

    /**
     * @return array validation rules for model attributes.
     */
    public function rules()
    {
        $rules = array(
            array('type, is_i18n, visible, reference_id, rules, view_in, compare_type, not_hide', 'numerical', 'integerOnly' => true),
            array('tip, label', 'i18nLength', 'max' => 255),
            array('measure_unit', 'length', 'max' => 30),
            array('compare_type', 'checkCompareType'),
            array($this->getI18nFieldSafe() . ', view_in', 'safe', 'on' => 'search'),
            array($this->getI18nFieldSafe() . ', saveTypes, saveObjTypes, objTypesArray, apTypesArray, json_data', 'safe'),
        );

        if ($this->scenario == 'advanced') {
            $rules[] = array('label', 'i18nRequired');
        }
        return $rules;
    }

    public function checkCompareType()
    {
        if ($this->scenario == 'advanced' &&
            (
                ($this->type == self::TYPE_INT && ($this->rules == self::RULE_NO_REQUIRED || $this->rules == self::RULE_REQUIRED || $this->rules == self::RULE_REQUIRED_NUMERICAL_FULL)) ||
                ($this->type == self::TYPE_RANGE && ($this->rules == self::RULE_NO_REQUIRED || $this->rules == self::RULE_REQUIRED)) ||
                (($this->type == self::TYPE_TEXT || $this->type == self::TYPE_TEXT_AREA) && ($this->rules == self::RULE_REQUIRED_NUMERICAL_FULL)) ||
                ($this->type == self::TYPE_TEXT_AREA_WS && ($this->rules == self::RULE_NUMERICAL || $this->rules == self::RULE_REQUIRED_NUMERICAL || $this->rules == self::RULE_REQUIRED_NUMERICAL_FULL)) ||
                (($this->type == self::TYPE_MULTY || $this->type == self::TYPE_REFERENCE) && ($this->rules == self::RULE_NUMERICAL || $this->rules == self::RULE_REQUIRED_NUMERICAL || $this->rules == self::RULE_REQUIRED_NUMERICAL_FULL))
            )
        ) {
            $this->addError('compare_type', tt('Such comparison is possible only for numeric fields'));
        }
    }

    /**
     * @return array relational rules.
     */
    public function relations()
    {
        return array(
            'objTypes' => array(self::MANY_MANY, 'ApartmentObjType', '{{formdesigner_obj_type}}(formdesigner_id, obj_type_id)'),
        );
    }

    /**
     * @return array customized attribute labels (name=>label)
     */
    public function attributeLabels()
    {
        return array(
            'id' => 'ID',
            'field' => tt('Field', 'formdesigner'),
            'is_i18n' => 'Is I18n',
            'visible' => tt('Visibility', 'formdesigner'),
            'filterObjTypes' => tt('Object type', 'apartments'),
            'objTypesArray' => tt('Show for property types', 'formdesigner'),
            'apTypesArray' => tt('Show for type of listing', 'formdesigner'),
            'tip' => tt('Tip', 'formdesigner'),
            'measure_unit' => tt('Measure unit', 'formdesigner'),
            'type' => tt('Type', 'formdesigner'),
            'reference_id' => tt('Reference', 'formdesigner'),
            'rules' => tt('Validation rules for a field', 'formdesigner'),
            'view_in' => tt('Display in', 'formdesigner'),
            'compare_type' => tt('Comparison in the search', 'formdesigner'),
            'label' => tt('Label', 'formdesigner'),
        );
    }

    public function i18nFields()
    {
        return array(
            'tip' => 'varchar(255) not null default ""',
            'label' => 'varchar(255) not null default ""',
        );
    }

    public function getTip()
    {
        return $this->getStrByLang('tip');
    }

    /**
     * Retrieves a list of models based on the current search/filter conditions.
     * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
     */
    public function search()
    {
        // Warning: Please modify the following code to remove attributes that
        // should not be searched.

        $criteria = new CDbCriteria;

        $criteria->compare($this->getTableAlias() . '.id', $this->id);
        $criteria->compare($this->getTableAlias() . '.field', $this->field, true);
        $criteria->compare($this->getTableAlias() . '.view_in', $this->view_in);
        $criteria->compare($this->getTableAlias() . '.visible', $this->visible);

        if ($this->view_in) {
            $this->minSorter = Yii::app()->db->createCommand()
                ->select('MIN(sorter) as minSorter')
                ->from($this->tableName())
                ->where('view_in=:id', array(':id' => $this->view_in))
                ->queryScalar();
            $this->maxSorter = Yii::app()->db->createCommand()
                ->select('MAX(sorter) as maxSorter')
                ->from($this->tableName())
                ->where('view_in=:id', array(':id' => $this->view_in))
                ->queryScalar();
        }

        $criteria->with = 'objTypes';

        return new CustomActiveDataProvider($this, array(
            'criteria' => $criteria,
            'sort' => array('defaultOrder' => $this->getTableAlias() . '.sorter ASC'),
            'pagination' => array(
                //'pageSize' => param('adminPaginationPageSize', 20),
                'pageSize' => (int)FormDesigner::model()->count($criteria),
            ),
        ));
    }

    public function getVisibleHtml()
    {
        $url = Yii::app()->controller->createUrl("visible", array("id" => $this->id));

        $img = CHtml::image(
            Yii::app()->theme->baseUrl . '/images/' . ($this->visible ? '' : 'in') . 'active.png', Yii::t('common', $this->visible ? 'Active' : 'Inactive'), array('title' => Yii::t('common', $this->visible ? 'Deactivate' : 'Activate'))
        );

        $options = array('onclick' => 'ajaxSetVisibleForm(this); return false;');

        return '<div class="center">' . CHtml::link($img, $url, $options) . '</div>';
    }

    public function getTypesHtml()
    {

        $objTypesName = array();

        foreach ($this->objTypes as $type) {
            $objTypesName[] = $type->name;
        }

        $html = '<div class="center">' . implode(', ', $objTypesName) . '</div>';
//        $html .= CHtml::link(tc('Configure'),
//            Yii::app()->createUrl('/formdesigner/backend/main/setup', array('id' => $this->id)),
//            array('class' => 'tempModal'));

        return CHtml::tag('div', array('id' => 'form_el_' . $this->id), $html);
    }

    public function getApTypesHtml()
    {

        $apTypesName = array();

        $types = HApartment::getTypesArray();

        $selectedTypesArr = (!empty($this->json_data)) ? CJSON::decode($this->json_data) : array();
        if (!empty($selectedTypesArr) && isset($selectedTypesArr['type'])) {
            $selectedTypesArr = $selectedTypesArr['type'];

            if (!empty($selectedTypesArr)) {
                $selectedTypesArr = array_combine($selectedTypesArr, $selectedTypesArr);
            }
        }

        if (!empty($types)) {
            foreach ($types as $key => $name) {
                if (isset($selectedTypesArr[$key])) {
                    $apTypesName[] = $name;
                }
            }
        }

        $html = '<div class="center">' . implode(', ', $apTypesName) . '</div>';

        return CHtml::tag('div', array('id' => 'form_el_ap_' . $this->id), $html);
    }

    public function visibleForm()
    {
        $objTypes = array();

        foreach ($this->objTypes as $type) {
            $objTypes[] = $type->id;
        }

        if (array_intersect($this->filterObjTypes, $objTypes)) {
            return true;
        }

        return false;
    }

    public function beforeSave()
    {
        if ($this->isNewRecord) {
            $maxSorter = Yii::app()->db->createCommand()
                ->select('MAX(sorter) as maxSorter')
                ->from($this->tableName())
                ->queryScalar();
            $this->sorter = $maxSorter + 1;
        }

        return parent::beforeSave();
    }

    public function afterSave()
    {
        if ($this->not_hide == 0) {
            $this->saveObjTypes();
        }

        return parent::afterSave();
    }

    private function saveObjTypes()
    {
        if ($this->scenario == 'save_types' || $this->scenario == 'advanced') {
            $sql = "DELETE FROM {{formdesigner_obj_type}} WHERE formdesigner_id=:formdesigner_id";
            Yii::app()->db->createCommand($sql)->execute(array(
                ':formdesigner_id' => $this->id,
            ));
        }

        if ($this->saveObjTypes) {
            foreach ($this->saveObjTypes as $typeID) {
                $formDesignerType = new FormDesignerObjType();
                $formDesignerType->formdesigner_id = $this->id;
                $formDesignerType->obj_type_id = $typeID;
                $formDesignerType->save();
            }
        }
    }

    public static function getDependency()
    {
        return new CDbCacheDependency('SELECT MAX(date_updated) FROM {{formdesigner}}');
    }

    private static $_cache;
    private static $_cacheByView;
    private static $_cacheNewFields = array();

    public static function canShow($field, Apartment $apartment)
    {
        if (!isset(self::$_cache)) {
            self::setCache();
        }

        if (!isset(self::$_cache[$field])) {
            return true;
        }

        switch (self::$_cache[$field]['visible']) {
            case self::VISIBLE_REGISTERED:
                if (Yii::app()->user->isGuest) {
                    return false;
                }
                break;

            case self::VISIBLE_OWNER_OR_ADMIN:
                if (!Yii::app()->user->checkAccess('backend_access') && !$apartment->isOwner()) {
                    return false;
                }
                break;

            case self::VISIBLE_ADMIN:
                if (!Yii::app()->user->checkAccess('backend_access')) {
                    return false;
                }
                break;
        }

        return in_array($apartment->obj_type_id, self::$_cache[$field]['objTypes']) && in_array($apartment->type, self::$_cache[$field]['apTypes']);
    }

    public static function getCacheByView()
    {
        if (!isset(self::$_cache)) {
            self::setCache();
        }

        return self::$_cacheByView;
    }

    public static function getCache()
    {
        if (!isset(self::$_cache)) {
            self::setCache();
        }

        return self::$_cache;
    }

    private static function setCache()
    {
        $fields = FormDesigner::model()
            ->with(array('objTypes'))
            ->findAll(array(
                'order' => 't.sorter ASC',
            ));

        /** @var $field FormDesigner */
        foreach ($fields as $field) {
            if ($field->standard_type == self::STANDARD_TYPE_NEW) {
                self::$_cacheNewFields[] = $field;
            }

            if ($field->view_in) {
                self::$_cacheByView[$field->view_in][] = $field;
            }

            self::$_cache[$field->field]['visible'] = $field->visible;
            self::$_cache[$field->field]['tip'] = $field->getTip();
            self::$_cache[$field->field]['label'] = $field->getLabel();
            if ($field->type == FormDesigner::TYPE_RANGE) {
                self::$_cache[$field->field . '_from']['label'] = $field->getLabel() . ', ' . tc('field_from');
                self::$_cache[$field->field . '_to']['label'] = $field->getLabel() . ', ' . tc('field_to');
            }

            self::$_cache[$field->field]['standard_type'] = $field->standard_type;

            self::$_cache[$field->field]['apTypes'] = is_array($field->getFromJson('type')) ? $field->getFromJson('type') : array();
            if (empty(self::$_cache[$field->field]['apTypes'])) {
                self::$_cache[$field->field]['apTypes'] = array();
            }
            self::$_cache[$field->field]['objTypes'] = array();
            foreach ($field->objTypes as $type) {
                self::$_cache[$field->field]['objTypes'][] = $type->id;
            }
        }
    }

    public static function getNewFields()
    {
        if (!isset(self::$_cache)) {
            self::setCache();
        }

        return self::$_cacheNewFields;
    }

    public function getObjTypesArray()
    {
        if (!$this->saveObjTypes) {
            if ($this->isNewRecord) {
                $this->saveObjTypes = array_keys(ApartmentObjType::getList());
            } else {
                $this->saveObjTypes = CHtml::listData($this->objTypes, 'id', 'id');
            }
        }

        return $this->saveObjTypes;
    }

    public function setObjTypesArray($value)
    {
        $this->saveObjTypes = $value;
    }

    public function getApTypesArray()
    {
        if (!$this->saveApTypes) {
            if ($this->isNewRecord) {
                $this->saveApTypes = array_keys(HApartment::getTypesArray());
            } else {
                $this->saveApTypes = $this->getFromJson('type');
            }
        }

        return $this->saveApTypes;
    }

    public function setApTypesArray($value)
    {
        $this->saveApTypes = $value;
        $this->setInJson('type', $value);
        //deb($value); exit;
    }

    public static function getTipForm($field)
    {
        if (!isset(self::$_cache)) {
            self::setCache();
        }

        if (!isset(self::$_cache[$field]['tip'])) {
            return '';
        }

        return '<div class="form_tip">' . self::$_cache[$field]['tip'] . '</div>';
    }

    public static function getLabelForm($field)
    {
        if (!isset(self::$_cache)) {
            self::setCache();
        }

        if (!isset(self::$_cache[$field])) {
            return '';
        }

        return (isset(self::$_cache[$field]['label'])) ? self::$_cache[$field]['label'] : '';
    }

    public function getLabel()
    {
        if ($this->standard_type == self::STANDARD_TYPE_NEW) {
            return $this->getStrByLang('label');
        } else {
            return Apartment::model()->getAttributeLabel($this->field);
        }
    }

    public function getUpdateUrl()
    {
        return $this->standard_type == self::STANDARD_TYPE_NEW ? Yii::app()->createUrl('/formeditor/backend/main/update', array('id' => $this->id)) :
            Yii::app()->createUrl('/formdesigner/backend/main/update', array('id' => $this->id));
    }

    public function beforeDelete()
    {
        $fieldName = $this->field;

        if ($this->type != FormDesigner::TYPE_RANGE) {
            $sql = "SELECT COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_NAME='{{apartment}}' AND COLUMN_NAME='{$fieldName}' AND table_schema = DATABASE()";
            $fieldExist = Yii::app()->db->createCommand($sql)->queryScalar();

            if ($fieldExist) {
                Yii::app()->db->createCommand("ALTER TABLE {{apartment}} DROP `{$fieldName}`")->execute();
            }
        } else {
            $field_from = $fieldName . '_from';
            $field_to = $fieldName . '_to';

            $sql = "SELECT COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_NAME='{{apartment}}' AND COLUMN_NAME='{$field_from}' AND table_schema = DATABASE()";
            $fieldExist = Yii::app()->db->createCommand($sql)->queryScalar();

            if ($fieldExist) {
                Yii::app()->db->createCommand("ALTER TABLE {{apartment}} DROP `{$field_from}`")->execute();
            }

            $sql = "SELECT COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_NAME='{{apartment}}' AND COLUMN_NAME='{$field_to}' AND table_schema = DATABASE()";
            $fieldExist = Yii::app()->db->createCommand($sql)->queryScalar();

            if ($fieldExist) {
                Yii::app()->db->createCommand("ALTER TABLE {{apartment}} DROP `{$field_to}`")->execute();
            }
        }

        Yii::app()->db->createCommand("DELETE FROM {{search_form}} WHERE field=:field")->execute(array(':field' => $fieldName));

        Yii::app()->cache->flush();

        return parent::beforeDelete();
    }

    public function getTranslateModel()
    {
        if ($this->type == self::TYPE_DEFAULT || $this->isNewRecord) {
            return NULL;
        }
        tc('Search by ' . $this->field);
        $model = TranslateMessage::model()->findByAttributes(array(
            'category' => 'common',
            'message' => 'Search by ' . $this->field
        ));
        return $model;
    }

    public static function setCacheListByCategoryID($lang)
    {
        if (!$lang) {
            $lang = Yii::app()->language;
        }

        self::$_listByCategoryID[$lang] = array();

        $tmp = 'title_' . $lang;
        $sql = "SELECT id, reference_category_id, $tmp AS name, for_rent, for_sale, rent, buy, exchange FROM {{apartment_reference_values}} ORDER BY sorter";
        $items = Yii::app()->db->createCommand($sql)->queryAll(true);

        if ($items) {
            foreach ($items as $item) {
                self::$_listByCategoryID[$lang][$item['reference_category_id']][] = array(
                    'id' => $item['id'],
                    'name' => $item['name'],
                    'for_rent' => $item['for_rent'],
                    'for_sale' => $item['for_sale'],
                    'rent' => $item['rent'],
                    'buy' => $item['buy'],
                    'exchange' => $item['exchange'],
                );
            }
        }

        return self::$_listByCategoryID[$lang];
    }

    public static function getListByCategoryID($categoryID, $adType = 0)
    {
        $lang = Yii::app()->language;
        if (!isset(self::$_listByCategoryID) || !isset(self::$_listByCategoryID[Yii::app()->language])) {
            self::setCacheListByCategoryID($lang);
        }

        $forRent = $forSale = $rent = $buy = $exchange = 0;
        switch ($adType) {
            case Apartment::TYPE_RENT:
                $forRent = 1;
                break;
            case Apartment::TYPE_SALE:
                $forSale = 1;
                break;
            case Apartment::TYPE_RENTING:
                $rent = 1;
                break;
            case Apartment::TYPE_BUY:
                $buy = 1;
                break;
            case Apartment::TYPE_CHANGE:
                $exchange = 1;
                break;
            default:
                $forRent = $forSale = $rent = $buy = $exchange = 1;
        }


        $items = (isset(self::$_listByCategoryID[$lang][$categoryID])) ? self::$_listByCategoryID[$lang][$categoryID] : array();
        if ($items) {
            foreach ($items as $key => $item) {
                if (
                    ($item['for_rent'] != $forRent)
                    && ($item['for_sale'] != $forSale)
                    && ($item['rent'] != $rent)
                    && ($item['buy'] != $buy)
                    && ($item['exchange'] != $exchange)
                ) {
                    unset($items[$key]);
                }
            }

            $items = CHtml::listData($items, 'id', 'name');
        }

        return $items;
    }

    public static function isShowForAnything($field)
    {
        $sql = "SELECT f.id FROM {{formdesigner}} f INNER JOIN {{formdesigner_obj_type}} fo ON fo.formdesigner_id = f.id WHERE field=:field";
        return Yii::app()->db->createCommand($sql)->queryScalar(array(':field' => $field));
    }

    public static function getFieldsWithoutTip()
    {
        return array(
            'location',
            'obj_type_id',
            'type',
            'price',
            'title',
            'parent_id',
            'references',
        );
    }
}
