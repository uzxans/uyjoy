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
 * Class Apartment
 *
 * @mixin ArLogBehavior
 */
class Apartment extends ParentModel
{
    use BadWordsTraitModel;

    public $title;
    public $isAjaxLoadOnUpdate = false;
    public $distanseFromViewSimilar;
    public $distanseFromViewSimilarInMeters;
    public $metroStations;
    public $metroStationsTitle;
    public $ownerEmail;
    public $ownerUsername;
    public $searchPaidService;
    public $in_currency;
    public $customCity;
    public $imagesList;

    const TYPE_RENT = 1;
    const TYPE_SALE = 2;
    const TYPE_RENTING = 3;
    const TYPE_BUY = 4;
    const TYPE_CHANGE = 5;
    const TYPE_DEFAULT = 1;
    const TYPE_DISABLED = 13;

    private static $_apartment_arr;
    private static $_apartment_del_arr;

    const PRICE_SALE = 1;
    const PRICE_PER_HOUR = 2;
    const PRICE_PER_DAY = 3;
    const PRICE_PER_WEEK = 4;
    const PRICE_PER_MONTH = 5;
    const PRICE_RENTING = 6;
    const PRICE_BUY = 7;
    const PRICE_CHANGE = 8;
    const STATUS_INACTIVE = 0;
    const STATUS_ACTIVE = 1;
    const STATUS_MODERATION = 2;
    const STATUS_DRAFT = 3;

    const DELETED_YES = 1;
    const DELETED_NO = 0;

    public $videoUpload;
    public $video_file;
    public $video_html;
    public $documentUpload;
    public $document_file;
    public $panoramaFile;
    public $references;
    public $period_activity;
    public $oldStatus;
    public $parent_id_autocomplete;
    public static $_parentAutoCompleteTemplate = '{id} - {title} - {address}';
    // search
    public $square_min;
    public $square_max;
    public $floor_min;
    public $floor_max;
    public $price_min;
    public $price_max;
    public $ot;
    public $wp;
    public $photo;
    public $rooms;
    public $metroSrc;
    public $apType;
    public $bStart;
    public $bEnd;
    public $term;

    public $itemsSelectedExport;

    public static function model($className = __CLASS__)
    {
        return parent::model($className);
    }

    public function tableName()
    {
        return '{{apartment}}';
    }

    public function behaviors()
    {
        $arr = array();
        $arr['ERememberFiltersBehavior'] = array(
            'class' => 'application.components.behaviors.ERememberFiltersBehavior',
            'defaults' => array(),
            'defaultStickOnClear' => false
        );
        $arr['AutoTimestampBehavior'] = array(
            'class' => 'zii.behaviors.CTimestampBehavior',
            'createAttribute' => 'date_created',
            'updateAttribute' => 'date_updated',
        );
        if (issetModule('historyChanges')) {
            $arr['ArLogBehavior'] = array(
                'class' => 'application.modules.historyChanges.components.ArLogBehavior',
            );
        }
        if (issetModule('api')) {
            $arr['renderModel'] = array(
                'class' => '\rest\model\Behavior',
            );
        }

        return $arr;
    }

    public function rules()
    {
        $video = ApartmentVideo::model();
        $panorama = ApartmentPanorama::model();
        $document = ApartmentDocuments::model();
        $rules = array(
            array('price', 'priceValidator', 'except' => 'video_file, video_html, panorama, document_file'),
            array('title', 'i18nRequired', 'except' => 'video_file, video_html, panorama, document_file'),
            array('price, price_to, floor, floor_total, window_to, type, price_type, obj_type_id, city_id, activity_always, count_img, parent_id, rating', 'numerical', 'integerOnly' => true),
            array('square, land_square, visits', 'numerical'),
            array('type', 'numerical', 'min' => 1),
            array('price_to', 'priceToValidator'),
            array('berths, customCity', 'length', 'max' => 255),
            array('title, address', 'i18nLength', 'max' => 255),
            array('lat, lng', 'length', 'max' => 25),
            array('phone', 'length', 'max' => 20),
            array('id', 'safe', 'on' => 'search'),
            array('floor', 'myFloorValidator'),
            array('is_price_poa', 'boolean'),
            array('title, address, description, description_near, exchange_to', 'i18nCheckDisabledWords'),
            array('in_currency, owner_active, num_of_rooms, is_special_offer, is_free_to, active, metroStations, note, period_activity, date_manual_updated, parent_id_autocomplete, imagesList', 'safe'),
            array($this->getI18nFieldSafe(), 'safe'),
            array('city_id,owner_active,active,type,obj_type_id,ownerEmail,ownerUsername,searchPaidService,deleted,visits,owner_id,rooms,ot,photo,square_min,square_max,price_min,price_max,floor_min,floor_max,metroSrc,bStart,bEnd,term', 'safe', 'on' => 'search'),
            array('video_html', 'checkHtmlCode' /* , 'on' => 'video_html' */),
            array(
                'video_file', 'file',
                'types' => $video->supportExt,
                'maxSize' => $video->fileMaxSize,
                'allowEmpty' => true,
                //'on' => 'video_file',
            ),
            array(
                'document_file', 'file',
                'types' => $document->supportExt,
                'maxSize' => $document->fileMaxSize,
                'allowEmpty' => true,
                //'on' => 'document_file',
            ),
            array(
                'panoramaFile', 'file',
                'types' => $panorama->supportedExt,
                'maxSize' => $panorama->maxSize,
                'tooLarge' => Yii::t('module_apartments', 'The file was larger than {size}MB. Please upload a smaller file.', array('{size}' => $panorama->maxSizeMb)),
                'allowEmpty' => true,
                //'on' => 'panorama',
            ),
        );

        if (issetModule('formeditor')) {
            $addRules = HFormEditor::getRulesForModel();
            $rules = CMap::mergeArray($rules, $addRules);
        }

        if (issetModule('location')) {
            $rules[] = array('loc_city, loc_region, loc_country', 'safe', 'on' => 'search');
            $rules[] = array('loc_city, loc_region, loc_country', 'numerical', 'integerOnly' => true);
        }

        if (issetModule('api')) {
            Yii::import('application.modules.api.models.Api');
            $restApi = new Api;
            $rules[] = array(
                $restApi->getApartmentsShowAttributes(),
                'safe',
                'on' => 'render'
            );
        }

        return $rules;
    }

    /** Use for new field in HFormEditor getRulesForModel
     * @param $attribute
     * @param null $params
     * @return bool
     */
    public function requiredAdvanced($attribute, $params = null)
    {
        if ($this->isUpdate()) {
            return true;
        }
        if (!isset($this->{$attribute})) {
            $field = FormDesigner::model()->find('field = "' . $attribute . '"');
            if ($field && $field->type == FormDesigner::TYPE_MULTY && $this->canShowInForm($attribute)) {
                if (!isset($_POST['category'][$field->reference_id])) {
                    if (!$this->hasErrors($attribute)) {
                        $this->addError($attribute, Yii::t('yii', '{attribute} cannot be blank.', array('{attribute}' => $this->getAttributeLabel($attribute))));
                    }
                }
            }
        } else {
            if ($this->canShowInForm($attribute) && $this->isEmpty($this->{$attribute})) {
                if (!$this->hasErrors($attribute)) {
                    $this->addError($attribute, Yii::t('yii', '{attribute} cannot be blank.', array('{attribute}' => $this->getAttributeLabel($attribute))));
                }
            }
        }
    }

    /** Use for new field in HFormEditor getRulesForModel
     * @param $attribute
     * @param null $params
     * @return bool
     */
    public function requiredAdvancedNumerical($attribute, $params = null)
    {
        if ($this->isUpdate()) {
            return true;
        }

        if ($this->canShowInForm($attribute) && !$this->{$attribute}) {
            if (!$this->hasErrors($attribute)) {
                $this->addError($attribute, Yii::t('yii', '{attribute} cannot be blank.', array('{attribute}' => $this->getAttributeLabel($attribute))));
            }
        }
    }

    /** Use for new field in HFormEditor getRulesForModel
     * @param $attribute
     * @param null $params
     * @return bool
     */
    public function requiredAdvancedRange($attribute, $params = null)
    {
        if ($this->isUpdate()) {
            return true;
        }

        $attribute_from = $attribute . '_from';
        $attribute_to = $attribute . '_to';

        if (isset($params['full']) && $params['full']) {
            if ($this->canShowInForm($attribute)) {
                if (!$this->{$attribute_from}) {
                    if (!$this->hasErrors($attribute_from)) {
                        $this->addError($attribute_from, Yii::t('yii', '{attribute} cannot be blank.', array('{attribute}' => $this->getAttributeLabel($attribute) . '&nbsp;' . tc('field_from'))));
                    }
                }
                if (!$this->{$attribute_to}) {
                    if (!$this->hasErrors($attribute_to)) {
                        $this->addError($attribute_to, Yii::t('yii', '{attribute} cannot be blank.', array('{attribute}' => $this->getAttributeLabel($attribute) . '&nbsp;' . tc('field_to'))));
                    }
                }
            }
        } else {
            if ($this->canShowInForm($attribute)) {
                if (!$this->{$attribute_from} && !$this->{$attribute_to}) {
                    if (!$this->hasErrors($attribute_to)) {
                        $this->addError($attribute_to, Yii::t('yii', '{attribute} cannot be blank.', array('{attribute}' => $this->getAttributeLabel($attribute) . '&nbsp;' . tc('field_to'))));
                    }
                    if (!$this->hasErrors($attribute_from)) {
                        $this->addError($attribute_from, Yii::t('yii', '{attribute} cannot be blank.', array('{attribute}' => $this->getAttributeLabel($attribute) . '&nbsp;' . tc('field_from'))));
                    }
                }
            }
        }
    }

    public function checkHtmlCode()
    {
        if ($this->video_html) {
            $apartmentVideoModel = new ApartmentVideo;
            $return = $apartmentVideoModel->parseVideoHTML($this->video_html);

            if (is_array($return) && isset($return[1])) {
                if ($return[1] == 'error') {
                    $this->addError('video_html', tt('incorrect_youtube_code', 'apartments'));
                } else {
                    if (isset($return[0]) && $return[0] === true) {
                        $this->video_html = $return[1];
                    }
                }
            }
        }
    }

    public function isUpdate()
    {
        return Yii::app()->request->getPost('is_update');
    }

    public function priceValidator($attribute, $params)
    {
        if ($this->isUpdate()) {
            return true;
        }

        if ($this->type == Apartment::TYPE_CHANGE) {
            return true;
        }

        if (issetModule('formeditor')) {
            $fields = FormDesigner::getCache();

            if (!isset($fields['price']['objTypes']) || (isset($fields['price']['objTypes']) && !in_array($this->obj_type_id, $fields['price']['objTypes']))) {
                return true;
            }
            if (!isset($fields['price']['apTypes']) || (isset($fields['price']['apTypes']) && !in_array($this->type, $fields['price']['apTypes']))) {
                return true;
            }
        }

        if (!$this->is_price_poa) {
            if (issetModule('seasonalprices') && $this->type == Apartment::TYPE_RENT) {
                if (Yii::app() instanceof CConsoleApplication) {
                    return true; # например, крон импорта объявлений
                }

                if (!Yii::app()->user->isGuest && $this->id) {
                    $sql = 'SELECT COUNT(id) FROM {{seasonal_prices}} WHERE apartment_id = ' . $this->id;
                    $res = Yii::app()->db->createCommand($sql)->queryScalar();
                } else {
                    $res = (Yii::app()->user->hasState('guest_ad_seasonal_prices')) ? unserialize(Yii::app()->user->getState('guest_ad_seasonal_prices')) : '';
                }

                if (!$res || $res < 1)
                    $this->addError('price', Yii::t('common', '{label} cannot be blank.', array('{label}' => $this->getAttributeLabel($attribute))));
            } else {
                if ((int)$this->price < 1 && (int)$this->price_to < 1) {
                    $this->addError('price', Yii::t('common', '{label} cannot be blank.', array('{label}' => $this->getAttributeLabel($attribute))));
                }
            }
        }
    }

    public function priceToValidator()
    {
        if ($this->price_to && $this->price) {
            if ($this->price_to < $this->price) {
                $this->addError('price', tt('priceToValidatorText', 'apartments'));
            }
        }
    }

    public function i18nFields()
    {
        return array(
            'title' => 'text null',
            'address' => 'varchar(255) not null default ""',
            'description' => 'text null',
            'description_near' => 'text null',
            'exchange_to' => 'text null'
        );
    }

    public function seoFields()
    {
        return array(
            'fieldTitle' => 'title',
            'fieldDescription' => 'description'
        );
    }

    public function currencyFields()
    {
        return array('price', 'price_to');
    }

    public function myFloorValidator($attribute, $params)
    {
        if ($this->floor && $this->floor_total) {
            if ($this->floor > $this->floor_total)
                $this->addError('floor', tt('validateFloorMoreTotal', 'apartments'));
        }
    }

    public function relations()
    {
        Yii::import('application.modules.apartmentObjType.models.ApartmentObjType');
        Yii::import('application.modules.apartmentCity.models.ApartmentCity');
        $relations = array(
            'objType' => array(self::BELONGS_TO, 'ApartmentObjType', 'obj_type_id'),
            'city' => array(self::BELONGS_TO, 'ApartmentCity', 'city_id', 'on' => 'city.active = 1'),
            'windowTo' => array(self::BELONGS_TO, 'WindowTo', 'window_to'),
            'images' => array(self::HAS_MANY, 'Images', 'id_object', 'order' => 'images.is_main DESC, images.sorter'),
            /* 'countImages' => array(self::STAT, 'Images', 'id_object'), */
            'countComments' => array(self::STAT, 'Comment', 'model_id', 'condition' => 'status = ' . Comment::STATUS_APPROVED . ' AND (model_name = "Apartment" OR model_name = "UserAds")'),
            'user' => array(self::BELONGS_TO, 'User', 'owner_id'),
            'video' => array(self::HAS_MANY, 'ApartmentVideo', 'apartment_id',
                'order' => 'video.id ASC',
            ),
            'panorama' => array(self::HAS_MANY, 'ApartmentPanorama', 'apartment_id',
                'order' => 'panorama.id ASC',
            ),
        );

        if (issetModule('bookingcalendar')) {
            //$bookingCalendar = new Bookingcalendar; // for publish assets
            $relations['bookingCalendar'] = array(self::HAS_MANY, 'Bookingcalendar', 'apartment_id');
        }

        if (issetModule('paidservices')) {
            $relations['paids'] = array(self::HAS_MANY, 'ApartmentPaid', 'apartment_id');
            $relations['paidActiveDisableSimilarListings'] = array(
                self::HAS_ONE,
                'ApartmentPaid',
                'apartment_id',
                'on' => 'padsl.status = ' . ApartmentPaid::STATUS_ACTIVE . ' AND padsl.paid_id = ' . PaidServices::ID_DISABLE_SIMILAR_LISINGS,
                'alias' => 'padsl'
            );
        }

        if (issetModule('location')) {
            $relations['locCountry'] = array(self::BELONGS_TO, 'Country', 'loc_country');
            $relations['locRegion'] = array(self::BELONGS_TO, 'Region', 'loc_region');
            $relations['locCity'] = array(self::BELONGS_TO, 'City', 'loc_city', 'on' => 'locCity.active = 1');
        }

        if (issetModule('seo')) {
            $relations['seo'] = array(self::HAS_ONE, 'SeoFriendlyUrl', 'model_id', 'on' => 'seo.model_name="Apartment"');
            //$relations['seo'] = array(self::HAS_ONE, 'SeoFriendlyUrl', 'model_id', 'on' => 'seo.model_name="Apartment"', 'group' => 'seo.model_id', 'order' => 'seo.id ASC');
        }

        if (issetModule('seasonalprices')) {
            /* if(isset(Yii::app()->controller) && isset(Yii::app()->controller->apType) && Yii::app()->controller->apType && in_array(Yii::app()->controller->apType, array(Apartment::TYPE_RENT))) {				
              $relations['seasonalPrices'] = array(self::HAS_MANY, 'Seasonalprices', 'apartment_id', 'order' => 'seasonalPrices.sorter', 'condition'=>'seasonalPrices.price_type = '.Yii::app()->controller->apType);
              $relations['seasonalPrices_sort_desc'] = array(self::HAS_ONE, 'Seasonalprices', 'apartment_id', 'order' => 'seasonalPrices_sort_desc.price DESC', 'condition'=>'seasonalPrices_sort_desc.price_type = '.Yii::app()->controller->apType);
              $relations['seasonalPrices_sort_asc'] = array(self::HAS_ONE, 'Seasonalprices', 'apartment_id', 'order' => 'seasonalPrices_sort_asc.price ASC', 'condition'=>'seasonalPrices_sort_asc.price_type = '.Yii::app()->controller->apType);
              } else {
              $relations['seasonalPrices'] = array(self::HAS_MANY, 'Seasonalprices', 'apartment_id', 'order' => 'seasonalPrices.sorter');
              $relations['seasonalPrices_sort_desc'] = array(self::HAS_ONE, 'Seasonalprices', 'apartment_id', 'order' => 'seasonalPrices_sort_desc.price DESC');
              $relations['seasonalPrices_sort_asc'] = array(self::HAS_ONE, 'Seasonalprices', 'apartment_id', 'order' => 'seasonalPrices_sort_asc.price ASC');
              } */

            $relations['seasonalPrices'] = array(self::HAS_MANY, 'Seasonalprices', 'apartment_id', 'order' => 'seasonalPrices.sorter');
            $relations['seasonalPrices_sort_desc'] = array(self::HAS_ONE, 'Seasonalprices', 'apartment_id', 'order' => 'seasonalPrices_sort_desc.price DESC');
            $relations['seasonalPrices_sort_asc'] = array(self::HAS_ONE, 'Seasonalprices', 'apartment_id', 'order' => 'seasonalPrices_sort_asc.price ASC');
        }

        $relations['apDocuments'] = array(self::HAS_MANY, 'ApartmentDocuments', 'apartment_id');

        $relations['parent'] = array(self::BELONGS_TO, 'Apartment', 'parent_id');
        $relations['childs'] = array(self::HAS_MANY, 'Apartment', 'parent_id');

        return $relations;
    }

    public function scopes()
    {

        if (Yii::app()->user->type == User::TYPE_AGENCY) {
            $sql = "SELECT id FROM {{users}} WHERE agency_user_id = :user_id AND agent_status=:status";
            $usersId = Yii::app()->db->createCommand($sql)->queryColumn(array(':user_id' => Yii::app()->user->id, ':status' => User::AGENT_STATUS_CONFIRMED));
            $usersId[] = Yii::app()->user->id;

            $ownerCondition = $this->getTableAlias() . '.owner_id IN (' . implode(',', $usersId) . ')';
        } else
            $ownerCondition = $this->getTableAlias() . '.owner_id = ' . Yii::app()->user->id;

        return array(
            'onlyAuthOwner' => array(
                'condition' => $ownerCondition,
            ),
            'notDeleted' => array(
                'condition' => $this->getTableAlias() . '.deleted = 0',
            ),
            'drafts' => array(
                'condition' => $this->getTableAlias() . '.active = ' . self::STATUS_DRAFT,
            ),
            'onlyActive' => array(
                'condition' => $this->getTableAlias() . '.deleted = 0 AND ' . $this->getTableAlias() . '.owner_active = '.self::STATUS_ACTIVE.' AND ' . $this->getTableAlias() . '.active = '.self::STATUS_ACTIVE,
            ),
            'withPhoto' => array(
                'condition' => 'count_img > 0',
            ),
        );
    }

    public function getUrl($absolute = true)
    {
        if (issetModule('seo')) {
            return $this->getRelationUrl($absolute);
        } else {
            return self::getUrlById($this->id, $absolute);
        }
    }

    public function getRelationUrl($absolute = true)
    {
        $method = $absolute ? 'createAbsoluteUrl' : 'createUrl';

        if (issetModule('seo')) {
            $seo = $this->seo;
            if ($this->seo) {
                $field = 'url_' . Yii::app()->language;
                if ($seo->$field) {
                    return Yii::app()->{$method}('/apartments/main/view', array(
                        'url' => $seo->$field . (param('urlExtension') ? '.html' : ''),
                    ));
                }
            }
        }

        return Yii::app()->{$method}('/apartments/main/view', array(
            'id' => $this->id,
        ));
    }

    public static function getUrlById($id, $absolute = true)
    {
        $method = $absolute ? 'createAbsoluteUrl' : 'createUrl';
        if (issetModule('seo')) {
            $seo = SeoFriendlyUrl::getForUrl($id, 'Apartment');

            if ($seo) {
                $field = 'url_' . Yii::app()->language;
                return Yii::app()->{$method}('/apartments/main/view', array(
                    'url' => $seo->$field . (param('urlExtension') ? '.html' : ''),
                ));
            }
        }

        return Yii::app()->{$method}('/apartments/main/view', array(
            'id' => $id,
        ));
    }

    public function getApartmentPhone()
    {
        if ($this->phone) {
            return $this->phone;
        } elseif (isset($this->user) && $this->user->phone) {
            return $this->user->phone;
        } elseif ($this->parse_from && $this->parse_owner_info_phone) {
            return $this->parse_owner_info_phone;
        }

        return null;
    }

    public function attributeLabels()
    {
        return array(
            'id' => tt('ID', 'apartments'),
            'type' => tt('Type', 'apartments'),
            'price' => tt('Price', 'apartments'),
            'num_of_rooms' => tt('Number of rooms', 'apartments'),
            'floor' => tt('Floor', 'apartments'),
            'floor_total' => tt('Total number of floors', 'apartments'),
            'floor_all' => tt('Floor', 'apartments') . '/' . tt('Total number of floors', 'apartments'),
            'square' => tt('Square', 'apartments'),
            'land_square' => tt('Land square', 'apartments'),
            'window_to' => tt('Window to', 'apartments'),
            'title' => tt('Apartment title', 'apartments'),
            'description' => tt('Description', 'apartments'),
            'description_near' => tt('What is near?', 'apartments'),
            'metro_station' => tt('Metro station', 'apartments'),
            'address' => tt('Address', 'apartments'),
            'special_offer' => tt('Special offer', 'apartments'),
            'berths' => tt('Number of berths', 'apartments'),
            'active' => tt('Status', 'apartments'),
            'metroStations' => tt('Nearest metro stations', 'apartments'),
            'is_free_to' => tt('to', 'apartments'),
            'is_special_offer' => tt('Special offer', 'apartments'),
            'obj_type_id' => tt('Object type', 'apartments'),
            'city_id' => tt('City', 'apartments'),
            'city' => tt('City', 'apartments'),
            'owner_active' => tt('Status (owner)', 'apartments'),
            'ownerEmail' => tt('Owner email', 'apartments'),
            'ownerUsername' => tt('ownerUsername', 'apartments'),
            'searchPaidService' => tc('Paid services'),
            'exchange_to' => tt('Exchange to', 'apartments'),
            'is_price_poa' => tt('is_price_poa', 'apartments'),
            'video_file' => tt('video_file', 'apartments'),
            'video_html' => tt('video_html', 'apartments'),
            'references' => tc('References'),
            'loc_country' => tc('Country'),
            'locCountry' => tc('Country'),
            'loc_region' => tc('Region'),
            'locRegion' => tc('Region'),
            'loc_city' => tc('City'),
            'locCity' => tc('City'),
            'location' => tt('Location', 'apartments'),
            'note' => tt('Note', 'apartments'),
            'phone' => tt('Owner phone', 'apartments'),
            'panoramaFile' => tc('A wide angle panorama-image or a ready SWF file of the panorama'),
            'period_activity' => tt("Period of listing's activity", 'apartments'),
            'deleted' => tt("Status (deleted)", 'apartments'),
            'visits' => tt("Views", 'apartments'),
            'parent_id' => tt("Is located", 'apartments'),
            'date_manual_updated' => tc('Last updated on'),
            'date_updated' => tc('Last updated on'),
            'customCity' => tt("Custom city", 'apartments'),
            'document_file' => tt('document_file', 'apartments'),
        );
    }

    public function getTitle()
    {
        return $this->getStrByLang('title');
    }

    public function searchAll()
    {
        $criteria = $this->buildBaseSearchCriteria();

        return new CustomActiveDataProvider($this, array(
            'criteria' => $criteria,
            'sort' => array('defaultOrder' => $this->getTableAlias() . '.sorter DESC'),
            'pagination' => array(
                'pageSize' => param('adminPaginationPageSize', 20),
            ),
        ));
    }

    public function search()
    {
        $criteria = $this->buildBaseSearchCriteria();

        $criteria->addCondition($this->getTableAlias() . '.active<>:draft');
        $criteria->params[':draft'] = self::STATUS_DRAFT;

        return new CustomActiveDataProvider($this, array(
            'criteria' => $criteria,
            'sort' => array('defaultOrder' => $this->getTableAlias() . '.sorter DESC'),
            'pagination' => array(
                'pageSize' => param('adminPaginationPageSize', 20),
            ),
        ));
    }

    public function searchExport()
    {
//        $this->owner_active = 1;
//        $this->active = 1;
        $criteria = $this->buildBaseSearchCriteria('export');

        $criteria->order = $this->getTableAlias() . '.sorter ASC';
        //$criteria->with = array('user');

        // Позволяем экспортировать не активные объекты TODO вынести в настройки
        $criteria->compare($this->getTableAlias() . '.deleted', 0);
        $criteria->compare($this->getTableAlias() . '.active', 1);
        $criteria->compare($this->getTableAlias() . '.owner_active', 1);

        $criteria->compare($this->getTableAlias() . '.is_price_poa', 0);
        $criteria->compare($this->getTableAlias() . '.type', [self::TYPE_RENT, self::TYPE_SALE]);
        $criteria->compare($this->getTableAlias() . '.price_type', [\Apartment::PRICE_PER_DAY, \Apartment::PRICE_PER_MONTH, \Apartment::PRICE_SALE]);
        //$criteria->addCondition('(LENGTH (user.phone) > 0)');

        $objTypes = \ApartmentObjType::getYANTypes();
        if ($objTypes) {
            $criteria->compare($this->getTableAlias() . '.obj_type_id', array_keys($objTypes));
        }

        //logs($criteria);

        return new CustomActiveDataProvider($this, array(
            'criteria' => $criteria,
            'pagination' => array(
                'pageSize' => param('adminPaginationPageSize', 20),
            ),
        ));
    }

    public function getPriceFrom()
    {
        if (issetModule('currency')) {
            return round(Currency::convertFromDefault($this->price), param('round_price', 2));
        }
        return $this->price;
    }

    public function getPriceTo()
    {
        if (issetModule('currency')) {
            return round(Currency::convertFromDefault($this->price_to), param('round_price', 2));
        }
        return $this->price_to;
    }

    public function getCurrency()
    {
        if (issetModule('currency')) {
            return Currency::getCurrentCurrencyName();
        } else {
            return param('siteCurrency', '$');
        }
    }

    public function afterFind()
    {
        $this->oldStatus = $this->active;
        if (issetModule('currency')) {
            $this->in_currency = Currency::getDefaultCurrencyModel()->char_code;
        } else {
            $this->in_currency = param('siteCurrency', '$');
        }

        if ($this->activity_always) {
            $this->period_activity = 'always';
        } else {
            $this->period_activity = param('apartment_periodActivityDefault', 'always');
        }

        parent::afterFind();
    }

    public function saveCategories()
    {
        $sql = 'SELECT reference_value_id FROM {{apartment_reference}} WHERE apartment_id="' . $this->id . '"';
        $existsRefs = Yii::app()->db->createCommand($sql)->queryAll();
        if ($existsRefs)
            $existsRefs = CHtml::listData($existsRefs, 'reference_value_id', 'reference_value_id');
        if (!is_array($existsRefs))
            $existsRefs = array();

        $sql = 'DELETE FROM {{apartment_reference}} WHERE apartment_id="' . $this->id . '"';
        Yii::app()->db->createCommand($sql)->execute();

        $newRefs = array();
        if (isset($_POST['category'])) {
            foreach ($_POST['category'] as $catId => $value) {
                foreach ($value as $valId => $val) {
                    $sql = 'INSERT INTO {{apartment_reference}} (reference_id, reference_value_id, apartment_id)
						VALUES (:refId, :refValId, :apId) ';
                    $command = Yii::app()->db->createCommand($sql);
                    $command->bindValue(":refId", $catId, PDO::PARAM_INT);
                    $command->bindValue(":refValId", $valId, PDO::PARAM_INT);
                    $command->bindValue(":apId", $this->id, PDO::PARAM_INT);
                    $command->execute();

                    $newRefs[$valId] = $valId;
                }
            }

            if (issetModule('historyChanges')) {
                $diffArr = array_merge(array_diff_assoc($existsRefs, $newRefs), array_diff_assoc($newRefs, $existsRefs));
                if (count($diffArr)) {
                    HistoryChanges::addApartmentInfoToHistory('update_reference', $this->id, 'update', implode(',', $existsRefs), implode(',', $newRefs));
                }
            }
        }
    }

    public function beforeValidate()
    {
        if (!Yii::app()->request->getParam('isCustomCity')) {
            $this->customCity = "";
        }

        return parent::beforeValidate();
    }

    public function beforeSave()
    {
        $this->setDefaultCorrectDBValues();

        $fieldTitle = 'title_' . Yii::app()->language;
        if (!$fieldTitle && $this->active != Apartment::STATUS_DRAFT) {
            $this->$fieldTitle = HApartment::genTitle($this);
        }

        $userInfo = User::model()->findByPk($this->owner_id);

        // чистим поля где есть визуальный редактор http://www.elisdn.ru/blog/12/dpurifytextbehavior-ispolzuem-html-purifier-dlia-filtracii-dannih-v-yii
        $allWs = HFormEditor::getAllFields();

        $activeLangs = Lang::getActiveLangs(true);
        foreach ($allWs as $row) {
            if ($row['type'] != FormDesigner::TYPE_TEXT_AREA_WS) {
                continue;
            }
            if ($row['is_i18n']) {
                foreach ($activeLangs as $lang) {
                    $attr = $row['field'] . '_' . $lang['name_iso'];
                    $this->{$attr} = purify($this->{$attr});
                }
            } else {
                $this->{$row['field']} = purify($this->{$row['field']});
            }
        }

        // удаляем parent_id если у типа недвижимости его нет
        if ($this->parent_id && $this->objType && !$this->objType->parent_id) {
            $this->parent_id = 0;
        }

        if ($this->isNewRecord) {
            $this->owner_id = $this->owner_id ? $this->owner_id : Yii::app()->user->id;

            if ($userInfo && in_array($userInfo->role, array(User::ROLE_MODERATOR, User::ROLE_ADMIN))) {
                $this->owner_active = self::STATUS_ACTIVE;
            }

            $maxSorter = Yii::app()->db->createCommand()
                ->select('MAX(sorter) as maxSorter')
                ->from($this->tableName())
                ->queryScalar();
            $this->sorter = $maxSorter + 1;

            if ($this->obj_type_id == 0) {
                $this->obj_type_id = Yii::app()->db->createCommand('SELECT MIN(id) FROM {{apartment_obj_type}}')->queryScalar();
            }
        }

        if (issetModule('currency')) {
            $defaultCurrencyCharCode = Currency::getDefaultCurrencyModel()->char_code;

            if (empty($this->in_currency)) {
                $this->in_currency = $defaultCurrencyCharCode;
            }

            if ($defaultCurrencyCharCode != $this->in_currency) {

                $this->price = (int)Currency::convert($this->price, $this->in_currency, $defaultCurrencyCharCode);

                if (isset($this->price_to) && $this->price_to) {
                    $this->price_to = (int)Currency::convert($this->price_to, $this->in_currency, $defaultCurrencyCharCode);
                }
            }
        }

        switch ($this->type) {
            /* case self::TYPE_RENT:
              $this->price_type = self::PRICE_PER_MONTH;
              break;
             */
            case self::TYPE_SALE:
                $this->price_type = self::PRICE_SALE;
                break;

            case self::TYPE_BUY:
                $this->price_type = self::PRICE_BUY;
                break;

            case self::TYPE_RENTING:
                $this->price_type = self::PRICE_RENTING;
                break;

            case self::TYPE_CHANGE:
                $this->price_type = self::PRICE_CHANGE;
                break;
        }

        $availablePriceTypes = array_keys(HApartment::getPriceArray($this->type, true));
        if (!in_array($this->price_type, $availablePriceTypes)) {
            /* if ($this->is_price_poa) {
              $this->price_type = min($availablePriceTypes);
              }
              else {
              $this->price_type = max($availablePriceTypes);
              } */
            $this->price_type = min($availablePriceTypes);
        }

        if (isset($_POST['set_period_activity']) && $_POST['set_period_activity'] == 1 && $this->period_activity) {
            $list = HApartment::getPeriodActivityList();
            if (isset($list[$this->period_activity])) {
                if ($this->period_activity == 'always') {
                    $this->activity_always = 1;
                } else {
                    $this->date_end_activity = date('Y-m-d', strtotime($this->period_activity, time()));
                    $this->activity_always = 0;
                }
            }
        }

        if ($this->customCity) {
            if (issetModule('location')) {
                $city = City::model()->find('country_id=:country AND region_id=:region AND name_' . Yii::app()->language . '=:name', array(':country' => $this->loc_country, ':region' => $this->loc_region, ':name' => $this->customCity));
                if ($city)
                    $this->loc_city = $city->id;
                else {
                    $cityNew = new City();
                    $cityNew->country_id = $this->loc_country;
                    $cityNew->region_id = $this->loc_region;
                    foreach (Lang::getActiveLangs() as $lang) {
                        $tmp = 'name_' . $lang;
                        $this->customCity = CHtml::encode($this->customCity);
                        $cityNew->$tmp = (Yii::app()->language == 'ru' && $lang != 'ru') ?
                            translit($this->customCity, 'dash', false, false) : $this->customCity;
                    }
                    $cityNew->active = Yii::app()->user->checkAccess('backend_access') ? City::STATUS_ACTIVE : City::STATUS_MODERATION;
                    if ($cityNew->save()) {
                        $this->loc_city = $cityNew->id;

                        if (!Yii::app()->user->checkAccess('backend_access')) {
                            Yii::app()->user->setFlash('notice', tt('City waiting for admin apporove', 'apartments'));
                            $notifier = new Notifier();
                            $notifier->raiseEvent('onNewCity', $cityNew);
                        }
                    } else
                        $this->loc_city = 0;
                }
            } else {
                $city = ApartmentCity::model()->find('name_' . Yii::app()->language . '=:name', array(':name' => $this->customCity));


                if ($city)
                    $this->city_id = $city->id;
                else {
                    $cityNew = new ApartmentCity();

                    foreach (Lang::getActiveLangs() as $lang) {
                        $tmp = 'name_' . $lang;
                        $this->customCity = CHtml::encode($this->customCity);
                        $cityNew->$tmp = (Yii::app()->language == 'ru' && $lang != 'ru') ?
                            translit($this->customCity, 'dash', false, false) : $this->customCity;
                    }

                    $cityNew->active = Yii::app()->user->checkAccess('backend_access') ? ApartmentCity::STATUS_ACTIVE : ApartmentCity::STATUS_MODERATION;
                    if ($cityNew->save()) {
                        $this->city_id = $cityNew->id;
                        Yii::app()->user->setFlash('info', tt('City waiting for admin apporove', 'apartments'));
                        if (!Yii::app()->user->checkAccess('backend_access')) {
                            Yii::app()->user->setFlash('notice', tt('City waiting for admin apporove', 'apartments'));
                            $notifier = new Notifier();
                            $notifier->raiseEvent('onNewCity', $cityNew);
                        }
                    } else
                        $this->city_id = 0;
                }
            }
        }

        return parent::beforeSave();
    }

    public function afterSave()
    {
        if ($this->scenario == 'savecat') {
            $this->saveCategories();
        }

        if (issetModule('seo') && !$this->isAjaxLoadOnUpdate) {
            SeoFriendlyUrl::getAndCreateForModel($this);
        }

        if ($this->isActive() && issetModule('socialposting')) {
            SocialpostingModel::preparePosting($this->id);
        }

        $owner = !empty($this->user) ? $this->user : null;

        if ($this->getIsNewObject() && (!$owner || ($owner && !in_array($owner->role, [User::ROLE_ADMIN, User::ROLE_MODERATOR])))) {
            $notifier = new Notifier();
            $notifier->raiseEvent('onNewApartment', $this);
        }

        if ($this->getIsNeedModerate()) {
            $notifier = new Notifier();
            $notifier->raiseEvent('onApartmentNeedModerate', $this);
        }

        return parent::afterSave();
    }

    public function makeClone()
    {
        $old_id = $this->id;

        $this->id = null;
        $this->isNewRecord = true;

        $activeLangs = Lang::getActiveLangs();

        foreach ($activeLangs as $lang) {
            $field = 'title_' . $lang;
            $this->$field = mb_substr(tt('Copy of', 'common', $lang) . ' ' . $this->$field, 0, 254);
        }
        if (Yii::app()->user->checkAccess('apartments_admin')) {
            $this->active = Apartment::STATUS_INACTIVE;
            $this->owner_active = Apartment::STATUS_ACTIVE;
        } else {
            if (param('useUseradsModeration', 1)) {
                $this->active = Apartment::STATUS_MODERATION;
            } else {
                $this->active = Apartment::STATUS_ACTIVE;
            }
            $this->owner_active = Apartment::STATUS_INACTIVE;
        }

        $this->unsetAttributes(array('autoVKPostId', 'autoFBPostId', 'autoTwitterPostId'));

        $maxSorter = Yii::app()->db->createCommand()
            ->select('MAX(sorter) as maxSorter')
            ->from($this->tableName())
            ->queryScalar();
        $this->sorter = $maxSorter + 1;
        $this->visits = 0;

        $this->save(false);

        if (issetModule('seasonalprices') && $this->type == Apartment::TYPE_RENT) {
            $sql = 'SELECT * FROM {{seasonal_prices}} WHERE apartment_id=:id';
            $result = Yii::app()->db->createCommand($sql)->queryAll(true, array(':id' => $old_id));

            if (!empty($result)) {
                foreach ($result as $key => &$res) {
                    unset($result[$key]['id']);
                    $res['apartment_id'] = $this->id;
                    $res['date_created'] = date(HSite::$dateFormat);
                }

                $builder = Yii::app()->db->schema->commandBuilder;
                $command = $builder->createMultipleInsertCommand('{{seasonal_prices}}', $result);
                $command->execute();

                unset($res, $result);
            }
        }

        $sql = 'SELECT * FROM {{apartment_reference}} WHERE apartment_id="' . $old_id . '"';
        $result = Yii::app()->db->createCommand($sql)->queryAll();

        if (!empty($result)) {
            foreach ($result as $key => &$res) {
                unset($result[$key]['id']);
                $res['apartment_id'] = $this->id;
            }

            $builder = Yii::app()->db->schema->commandBuilder;
            $command = $builder->createMultipleInsertCommand('{{apartment_reference}}', $result);
            $command->execute();

            unset($res, $result);
        }

        $sql = 'SELECT * FROM {{apartment_video}} WHERE apartment_id="' . $old_id . '"';
        $result = Yii::app()->db->createCommand($sql)->queryAll();

        $oldPathVideo = Yii::getPathOfAlias('webroot.uploads.video') . DIRECTORY_SEPARATOR . $old_id;
        $newPathVideo = Yii::getPathOfAlias('webroot.uploads.video') . DIRECTORY_SEPARATOR . $this->id;

        if ($result && newFolder($newPathVideo)) {
            foreach ($result as $res) {
                $sql = 'INSERT INTO {{apartment_video}} (apartment_id, video_file, 	video_html, date_updated)
                            VALUES ("' . $this->id . '", "' . $res['video_file'] . '", "' . $res['video_html'] . '", NOW())';
                Yii::app()->db->createCommand($sql)->execute();

                if ($res['video_file'])
                    copy($oldPathVideo . DIRECTORY_SEPARATOR . $res['video_file'], $newPathVideo . DIRECTORY_SEPARATOR . $res['video_file']);
            }
        }

        $oldPathDocument = Yii::getPathOfAlias('webroot.uploads.document') . DIRECTORY_SEPARATOR . $old_id;
        $newPathDocument = Yii::getPathOfAlias('webroot.uploads.document') . DIRECTORY_SEPARATOR . $this->id;

        if ($result && newFolder($newPathDocument)) {
            foreach ($result as $res) {
                $sql = 'INSERT INTO {{apartment_document}} (apartment_id, original_name, modified_name, date_updated)
                            VALUES ("' . $this->id . '", "' . $res['original_name'] . '", "' . $res['modified_name'] . '", NOW())';
                Yii::app()->db->createCommand($sql)->execute();

                if ($res['modified_name'])
                    copy($oldPathDocument . DIRECTORY_SEPARATOR . $res['modified_name'], $newPathDocument . DIRECTORY_SEPARATOR . $res['modified_name']);
            }
        }

        $oldPathUploads = Yii::getPathOfAlias('webroot.uploads.objects') . DIRECTORY_SEPARATOR . $old_id;
        $newPathUploads = Yii::getPathOfAlias('webroot.uploads.objects') . DIRECTORY_SEPARATOR . $this->id;

        if (newFolder($newPathUploads)) {
            $sql = 'SELECT * FROM {{apartment_panorama}} WHERE apartment_id="' . $old_id . '"';
            $result = Yii::app()->db->createCommand($sql)->queryAll();

            if ($result) {
                foreach ($result as $res) {
                    $sql = 'INSERT INTO {{apartment_panorama}} (apartment_id, name, width, height, date_created)
                            VALUES ("' . $this->id . '", "' . $res['name'] . '", "' . $res['width'] . '", "' . $res['height'] . '", NOW())';
                    Yii::app()->db->createCommand($sql)->execute();

                    copy($oldPathUploads . DIRECTORY_SEPARATOR . $res['name'], $newPathUploads . DIRECTORY_SEPARATOR . $res['name']);
                }
            }
            $oldPathImages = $oldPathUploads . DIRECTORY_SEPARATOR . Images::ORIGINAL_IMG_DIR;
            $newPathImages = $newPathUploads . DIRECTORY_SEPARATOR . Images::ORIGINAL_IMG_DIR;
            $newPathImagesModified = $newPathUploads . DIRECTORY_SEPARATOR . Images::MODIFIED_IMG_DIR;
            if (newFolder($newPathImages) && newFolder($newPathImagesModified)) {
                $sql = 'SELECT * FROM {{images}} WHERE id_object="' . $old_id . '"';
                $result = Yii::app()->db->createCommand($sql)->queryAll();

                if ($result) {
                    foreach ($result as $res) {
                        copy($oldPathImages . DIRECTORY_SEPARATOR . $res['file_name'], $newPathImages . DIRECTORY_SEPARATOR . $res['file_name']);
                    }

                    foreach ($result as $key => &$res) {
                        unset($result[$key]['id']);
                        $res['id_object'] = $this->id;
                        $res['date_created'] = date(HSite::$dateFormat);
                    }

                    $builder = Yii::app()->db->schema->commandBuilder;
                    $command = $builder->createMultipleInsertCommand('{{images}}', $result);
                    $command->execute();

                    unset($res, $result);
                }
            }
        }
    }

    public function beforeDelete()
    {
        if (param('notDeleteListings', 0) && empty($this->parse_from)) {
            $this->setAttribute('deleted', true);
            $this->update(array('deleted'));
            return false;
        }

        if (issetModule('seo')) {
            $sql = 'DELETE FROM {{seo_friendly_url}} WHERE model_id="' . $this->id . '" AND ( model_name = "Apartment" OR model_name = "UserAds" )';
            Yii::app()->db->createCommand($sql)->execute();

            $sql = 'DELETE FROM {{seo_friendly_url_history}} WHERE model_id="' . $this->id . '" AND ( model_name = "Apartment" OR model_name = "UserAds" )';
            Yii::app()->db->createCommand($sql)->execute();
        }

        $sql = 'DELETE FROM {{apartment_reference}} WHERE apartment_id="' . $this->id . '"';
        Yii::app()->db->createCommand($sql)->execute();

        $sql = 'DELETE FROM {{comments}} WHERE model_id="' . $this->id . '" AND model_name="Apartment"';
        Yii::app()->db->createCommand($sql)->execute();

        $sql = 'DELETE FROM {{apartment_statistics}} WHERE apartment_id="' . $this->id . '"';
        Yii::app()->db->createCommand($sql)->execute();

        $sql = 'DELETE FROM {{apartment_complain}} WHERE apartment_id="' . $this->id . '"';
        Yii::app()->db->createCommand($sql)->execute();

        //Images::deleteByObjectId($this);
        Images::deleteDbByObjectId($this->id);

        $dir = Yii::getPathOfAlias('webroot.uploads.objects') . '/' . $this->id;
        rrmdir($dir);

        if (issetModule('metroStations')) {
            MetroStations::deleteApartmentStations($this->id);
        }

        //delete QR-code
        $qr_codes = glob(Yii::getPathOfAlias('webroot.uploads.qrcodes') . '/listing_' . $this->id . '-*.png');
        if (is_array($qr_codes) && count($qr_codes))
            array_map("unlink", $qr_codes);

        // delete video
        $sql = 'DELETE FROM {{apartment_video}} WHERE apartment_id="' . $this->id . '"';
        Yii::app()->db->createCommand($sql)->execute();

        $pathVideo = Yii::getPathOfAlias('webroot.uploads.video') . DIRECTORY_SEPARATOR . $this->id;
        rmrf($pathVideo);

        // delete document
        $sql = 'DELETE FROM {{apartment_document}} WHERE apartment_id="' . $this->id . '"';
        Yii::app()->db->createCommand($sql)->execute();

        $pathDocument = Yii::getPathOfAlias('webroot.uploads.document') . DIRECTORY_SEPARATOR . $this->id;
        rmrf($pathDocument);

        if (issetModule('bookingcalendar')) {
            $sql = 'DELETE FROM {{booking_calendar}} WHERE apartment_id="' . $this->id . '"';
            Yii::app()->db->createCommand($sql)->execute();
        }

        if (issetModule('comparisonList')) {
            $sql = 'DELETE FROM {{comparison_list}} WHERE apartment_id="' . $this->id . '"';
            Yii::app()->db->createCommand($sql)->execute();
        }

        if (issetModule('seasonalprices')) {
            $sql = 'DELETE FROM {{seasonal_prices}} WHERE apartment_id="' . $this->id . '"';
            Yii::app()->db->createCommand($sql)->execute();
        }

        Yii::app()->cache->flush();

        return parent::beforeDelete();
    }

    public function isValidApartment($id)
    {
        $sql = 'SELECT id FROM {{apartment}} WHERE id = :id';
        $command = Yii::app()->db->createCommand($sql);
        return $command->queryScalar(array(':id' => $id));
    }

    public static function getDependency()
    {
        return new CDbCacheDependency('SELECT MAX(date_updated) FROM {{apartment}}');
    }

    public static function getExistsRooms()
    {
        $sql = 'SELECT DISTINCT num_of_rooms FROM {{apartment}} WHERE active=' . self::STATUS_ACTIVE . ' AND owner_active = ' . self::STATUS_ACTIVE . ' AND num_of_rooms > 0 ORDER BY num_of_rooms';
        return Yii::app()->db->cache(param('cachingTime', 86400), self::getDependency())->createCommand($sql)->queryColumn();
    }

    public static function getObjTypesArray($with_all = false, $withExclude = true)
    {
        $objTypes = array();
        $objTypeModel = ApartmentObjType::model()->findAll(array(
            'order' => 'sorter'
        ));
        $excludeList = ApartmentObjType::getListExclude('search');
        foreach ($objTypeModel as $type) {
            if ($withExclude && in_array($type->id, $excludeList)) {
                continue;
            }
            $objTypes[$type->id] = $type->name;
        }
        if ($with_all) {
            $objTypes[0] = tt('All object', 'apartments');
        }
        return $objTypes;
    }

    public static function getPriceName($price_type)
    {
        if (!isset(self::$_price_arr)) {
            self::$_price_arr = HApartment::getPriceArray(NULL, true);
        }
        return self::$_price_arr[$price_type];
    }

    public function getPriceType()
    {
        $priceType = $this->price_type;

        if (issetModule('seasonalprices') && isset($this->seasonalPrices) && $this->seasonalPrices && $this->type == Apartment::TYPE_RENT && count($this->seasonalPrices) == 1) {
            $priceType = $this->seasonalPrices[0]->price_type;
        }

        return $priceType;
    }

    public function getPrettyPrice($showPriceType = true)
    {
        if (!$this->canShowInView('price'))
            return '';

        if ($this->is_price_poa)
            return tt('is_price_poa', 'apartments');

        $priceType = $this->getPriceType();
        $price = $this->getPriceFrom();
        $priceTo = $this->getPriceTo();
        $isPriceFromTo = $this->isPriceFromTo();

        if (issetModule('seasonalprices') && isset($this->seasonalPrices) && $this->seasonalPrices && $this->type == Apartment::TYPE_RENT) {
            $pricesSeasonalArr = $this->getMinMaxSeasonalPrices();

            $price = (issetModule('currency')) ? round(Currency::convertFromDefault($pricesSeasonalArr['minSeasonalPrice']), param('round_price', 2)) : $pricesSeasonalArr['minSeasonalPrice'];
            if (count($this->seasonalPrices) == 1) {
                $showPriceType = true;
            } else {
                if ($pricesSeasonalArr['minSeasonalPrice'] != $pricesSeasonalArr['maxSeasonalPrice']) {
                    $showPriceType = false;
                    $isPriceFromTo = true;
                    $priceTo = (issetModule('currency')) ? round(Currency::convertFromDefault($pricesSeasonalArr['maxSeasonalPrice']), param('round_price', 2)) : $pricesSeasonalArr['maxSeasonalPrice'];
                }
            }
        }


        $tpl = Lang::getTemplateForPrice(Yii::app()->language);

        if ($isPriceFromTo) {
            $priceFromTo = '';
            if ($price) {
                $data = array(
                    '{CURRENCY}' => $this->getCurrency(),
                    '{TEXT_FROM}' => tc('price_from'),
                    '{PRICE}' => $this->setPretty($price),
                );
                $priceFromTo = strtr($tpl['from'], $data);
            }
            if ($priceTo) {
                $data = array(
                    '{CURRENCY}' => $this->getCurrency(),
                    '{TEXT_TO}' => tc('price_to'),
                    '{PRICE}' => $this->setPretty($priceTo),
                );
                $priceFromTo .= strtr($tpl['to'], $data);
            }

            return $priceFromTo;
        }

        $data = array(
            '{CURRENCY}' => $this->getCurrency(),
            '{PRICE}' => $this->setPretty($price),
            '{TYPE}' => ($showPriceType) ? HApartment::getPriceName($priceType) : '',
        );

        return strtr($tpl['default'], $data);

    }

    public function isPriceFromTo()
    {
        return $this->type == self::TYPE_RENTING || $this->type == self::TYPE_BUY;
    }

    public function setPretty($price)
    {
        $priceStr = Apartment::setPrePretty($price);
        return $priceStr;
    }

    public static function setPrePretty($price)
    {
        if (!param('usePrettyPrice', 1))
            return Apartment::priceFormat($price);

        $price = (0 + str_replace(",", "", $price));
        if (!is_numeric($price))
            return '---';

        return Apartment::setPrettyPrice($price);
    }

    public static function setPrettyPrice($price)
    {
        $priceStr = '';
        if ($price >= 1000000000000)
            $priceStr = round(($price / 1000000000000), 9) . ' ' . tt('trillion', 'apartments');
        elseif ($price >= 1000000000)
            $priceStr = round(($price / 1000000000), 8) . ' ' . tt('billion', 'apartments');
        elseif ($price >= 1000000)
            $priceStr = round(($price / 1000000), 6) . ' ' . tt('million', 'apartments');
        elseif ($price >= 1000)
            $priceStr = round(($price / 1000), 3) . ' ' . tt('thousand', 'apartments');
        else
            $priceStr = Apartment::priceFormat($price);

        return $priceStr;
    }

    public static function priceFormat($price)
    {
        if (is_numeric($price)) {
            $priceDecimalsPoint = Lang::getLangPriceDecimalsPoint(Yii::app()->language);
            $priceThousandsSeparator = Lang::getLangPriceThousandsSeparator(Yii::app()->language);

            return number_format($price, 0, $priceDecimalsPoint, $priceThousandsSeparator);
        }

        return $price;
    }

    public static function getApTypes()
    {
        $ownerActiveCond = '';
        $useIndex = 'FORCE INDEX (type_priceType_halfActive)';

        if (param('useUserads')) {
            $ownerActiveCond = ' AND a.owner_active = ' . self::STATUS_ACTIVE . ' ';
            $useIndex = 'FORCE INDEX (type_priceType_fullActive)';
        }

        $sql = 'SELECT DISTINCT a.price_type FROM {{apartment}} as a ' . $useIndex . ' WHERE a.type IN (' . implode(',', HApartment::availableApTypesIds()) . ') AND a.active = ' . self::STATUS_ACTIVE . ' ' . $ownerActiveCond . '';
        $res = Yii::app()->db->cache(param('cachingTime', 86400), self::getDependency())->createCommand($sql)->queryColumn();

        if (issetModule('seasonalprices')) {
            $sql = 'SELECT DISTINCT s.price_type FROM {{seasonal_prices}} as s LEFT JOIN {{apartment}} as a ON s.apartment_id=a.id WHERE a.type IN (' . implode(',', HApartment::availableApTypesIds()) . ') AND a.active = ' . self::STATUS_ACTIVE . ' ' . $ownerActiveCond . '';
            $resSeasonPricesPriceTypes = Yii::app()->db->cache(param('cachingTime', 86400), self::getDependency())->createCommand($sql)->queryColumn();

            return CMap::mergeArray($res, $resSeasonPricesPriceTypes);
        }

        return $res;
    }

    public static function getSquareMinMax()
    {
        $ownerActiveCond = '';
        $useIndex = 'FORCE INDEX (type_priceType_halfActive)';

        if (param('useUserads')) {
            $ownerActiveCond = ' AND owner_active = ' . self::STATUS_ACTIVE . ' ';
            $useIndex = 'FORCE INDEX (type_priceType_fullActive)';
        }

        $sql = 'SELECT MIN(square) as square_min, MAX(square) as square_max FROM {{apartment}} ' . $useIndex . ' WHERE price_type IN(' . implode(",", array_keys(HApartment::getPriceArray(Apartment::PRICE_SALE, true))) . ') AND active = ' . self::STATUS_ACTIVE . ' ' . $ownerActiveCond . '';
        return Yii::app()->db->cache(param('cachingTime', 86400), self::getDependency())->createCommand($sql)->queryRow();
    }

    public static function getModerationStatusArray($withAll = false)
    {
        $status = array();
        if ($withAll) {
            $status[''] = tt('All', 'common');
        }

        $status[self::STATUS_INACTIVE] = CHtml::encode(tt('Inactive', 'common'));
        $status[self::STATUS_ACTIVE] = CHtml::encode(tt('Active', 'common'));
        $status[self::STATUS_MODERATION] = CHtml::encode(tt('Awaiting moderation', 'common'));

        return $status;
    }

    public static function getAvalaibleStatusArray()
    {
        $statusesArr = self::getModerationStatusArray();
        if (!param('useUseradsModeration', 0)) {
            if (array_key_exists(self::STATUS_MODERATION, $statusesArr))
                unset($statusesArr[self::STATUS_MODERATION]);
        }

        return $statusesArr;
    }

    public static function getRel($id, $lang)
    {
        $model = self::model()->resetScope()->findByPk($id);

        $title = 'title_' . $lang;
        $model->title = $model->$title;

        return $model;
    }

    public function getAddress()
    {
        return $this->getStrByLang('address');
    }

    public function getDescription()
    {
        return $this->getStrByLang('description');
    }

    public function getDescription_Near()
    {
        return $this->getStrByLang('description_near');
    }

    public static function getApartmentsStatusArray($withAll = false)
    {
        $status = array();
        if ($withAll) {
            $status[''] = Yii::t('common', 'All');
        }

        $status[self::STATUS_INACTIVE] = Yii::t('common', 'Inactive');
        $status[self::STATUS_ACTIVE] = Yii::t('common', 'Active');

        return $status;
    }

    public static function getApartmentsDeletedArray($withAll = false)
    {
        $status = array();
        if ($withAll) {
            $status[''] = Yii::t('common', 'All');
        }

        $status[0] = Yii::t('common', 'Active');
        $status[1] = Yii::t('common', 'Deleted');

        return $status;
    }

    public static function getApartmentsDeleted($status)
    {
        if (!isset(self::$_apartment_del_arr)) {
            self::$_apartment_del_arr = self::getApartmentsDeletedArray();
        }
        return self::$_apartment_del_arr[$status];
    }

    public static function getApartmentsStatus($status)
    {
        if (!isset(self::$_apartment_arr)) {
            self::$_apartment_arr = self::getApartmentsStatusArray();
        }
        return self::$_apartment_arr[$status];
    }

    public static function setApartmentVisitCount(Apartment $apartment, $ipAddress = '', $userAgent = '')
    {
        if (isset($apartment->id) && $apartment->id) {
            // total
            Yii::app()->db->createCommand()->update('{{apartment}}', array('visits' => new CDbExpression("visits+1")), 'id=:id', array(':id' => $apartment->id));

            // today
            Yii::app()->db->createCommand()->insert('{{apartment_statistics}}', array(
                'apartment_id' => $apartment->id,
                'date_created' => date(HSite::$dateFormat),
                'ip_address' => $ipAddress,
                'browser' => substr($userAgent, 0, 255),
            ));
        }
    }

    public static function getApartmentVisitCount(Apartment $apartment)
    {
        if (isset($apartment->id) && $apartment->id) {
            $statistics = array();

            $statistics['all'] = Yii::app()->db->createCommand()
                ->select('visits')
                ->from('{{apartment}}')
                ->where('id = "' . intval($apartment->id) . '"')
                ->queryScalar();

            $statistics['today'] = Yii::app()->db->createCommand()
                ->select(array(new CDbExpression("COUNT(id) AS countToday")))
                ->from('{{apartment_statistics}}')
                ->where('apartment_id = "' . intval($apartment->id) . '" AND date(date_created)=date(now())')
                ->queryScalar();

            if ($statistics['all'] < $statistics['today'])
                $statistics['all'] = $statistics['today'];

            return $statistics;
        }
        return false;
    }

    public function getUrlSendEmail()
    {
        return Yii::app()->createUrl('/apartments/main/sendEmail', array('id' => $this->id));
    }

    public function getObjType4table()
    {
        $str = $this->objType->getName();
        if ($this->num_of_rooms) {
            $str .= '<br/>' . Yii::t('module_apartments', '{n} rooms', $this->num_of_rooms);
        }
        return $str;
    }

    public function getRowCssClass()
    {
        $ret = '';
        if ($this->is_special_offer) {
            $ret = 'special_offer_tr';
        }
        if ($this->date_up_search != '0000-00-00 00:00:00' && $this->date_up_search != null) {
            $ret .= ' up_in_search';
        }
        return $ret;
    }

    public function getMapIconUrl()
    {
        if (isset($this->objType) && $this->objType->icon_file) {
            $iconUrl = Yii::app()->getBaseUrl() . '/' . $this->objType->iconsMapPath . '/' . $this->objType->icon_file;
        } else {
            $iconUrl = Yii::app()->theme->baseUrl . "/images/house.png";
        }

        return $iconUrl;
    }

    public function canShowInView($field, $type = false, $isPrintable = false)
    {

        switch ($field) {
            case 'floor_all':
                if (!$this->floor && !$this->floor_total) {
                    return false;
                }
                break;

            case 'phone':
                if ($isPrintable)
                    return false;

                if (!$this->phone) {
                    if (!isset($this->user) || !$this->user->phone) {
                        return false;
                    }
                }
                break;
            case 'price':
                break;

            case 'metroStations':
                if (!issetModule('metroStations')) {
                    return false;
                }
                break;

            default:
                if ($type == FormDesigner::TYPE_RANGE) {
                    $field_from = $field . '_from';
                    $field_to = $field . '_to';
                    if ((!isset($this->$field_from) || !$this->$field_from) && (!isset($this->$field_to) || !$this->$field_to))
                        return false;
                } elseif (!($type == FormDesigner::TYPE_MULTY) && (!isset($this->$field) || !$this->$field)) {
                    return false;
                }
        }

        if (issetModule('formdesigner')) {
            Yii::import('application.modules.formdesigner.models.*');
            return FormDesigner::canShow($field, $this);
        }

        return true;
    }

    public function canShowInForm($field)
    {
        if (issetModule('formdesigner')) {
            Yii::import('application.modules.formdesigner.models.*');
            return FormDesigner::canShow($field, $this);
        }
        return true;
    }

    public function isOwner($orAdmin = false)
    {
        $isOwner = ($this->owner_id == Yii::app()->user->id ||
            (Yii::app()->user->type == User::TYPE_AGENCY && ($this->user && $this->user->agency_user_id == Yii::app()->user->id)));
        if ($isOwner || ($orAdmin && Yii::app()->user->checkAccess('backend_access'))) {
            return true;
        }
        return false;
    }

    public function getEditUrl()
    {
        $editUrl = '';

        if (Yii::app()->user->checkAccess('backend_access')) {
            $editUrl = Yii::app()->createUrl('/apartments/backend/main/update', array('id' => $this->id));
        } elseif ($this->isOwner() && $this->deleted == self::DELETED_NO) {
            $editUrl = Yii::app()->createUrl('/userads/main/update', array('id' => $this->id));
        }
        return $editUrl;
    }

    public function getAttributeLabel($attribute)
    {
        if (issetModule('formeditor')) {
            $label = FormDesigner::getLabelForm($attribute);

            return $label ? $label : parent::getAttributeLabel($attribute);
        }

        return parent::getAttributeLabel($attribute);
    }

    public static function returnMainThumbForGrid($data = null, $addClass = '', $from = 'backend')
    {
        if ($data) {
            $width = ($from == 'backend') ? 60 : 150;
            $height = ($from == 'backend') ? 45 : 100;

            $res = Images::getMainThumb($width, $height, $data->images);

            return CHtml::image($res['thumbUrl'], $data->getStrByLang('title'), array(
                'title' => $data->getStrByLang('title'),
                'class' => 'apartment_type_img_small ' . $addClass,
                'loading'   => 'lazy'
            ));
        }
    }

    public function setDefaultType()
    {
        $flags = array(
            Apartment::TYPE_RENT => param('useTypeRentHour', 1) || param('useTypeRentDay', 1) || param('useTypeRentWeek', 1) || param('useTypeRentMonth', 1),
            Apartment::TYPE_SALE => param('useTypeSale', 1),
            Apartment::TYPE_RENTING => param('useTypeRenting', 1),
            Apartment::TYPE_BUY => param('useTypeBuy', 1),
            Apartment::TYPE_CHANGE => param('useTypeChange', 1),
        );

        $this->type = 0;

        $defaultType = (Yii::app()->request->getQuery('ajax') == 'apartment-seasonal-prices-grid') ? Apartment::TYPE_RENT : param('defaultApartmentType', 0); //Guest ad seasonal prices hook
        if (isset($flags[$defaultType]) && $flags[$defaultType]) {
            $this->type = $defaultType;
        }

        if (!$this->type) {
            foreach ($flags as $type => $enable) {
                if ($enable)
                    $this->type = $type;
            }
        }
    }

    public function canSetPeriodActivity()
    {
        return $this->activity_always || time() >= strtotime($this->date_end_activity);
    }

    public function getDateEndActivityLongFormat()
    {
        //return Yii::app()->dateFormatter->format(Yii::app()->locale->getDateFormat('long'), CDateTimeParser::parse($this->date_end_activity, 'yyyy-MM-dd'));
        return Yii::app()->dateFormatter->format(Yii::app()->locale->getDateFormat('long'), $this->date_end_activity);
    }

    public function writeRating($id, $rating)
    {
        $sql = 'UPDATE {{apartment}} SET rating=:rating WHERE id=:id';
        Yii::app()->db->createCommand($sql)->execute(array(':rating' => $rating, ':id' => $id));
    }

    public function getSquareString()
    {
        if ($this->canShowInForm('square')) {
            return $this->square . " " . tc("site_square");
        }

        if ($this->canShowInForm('land_square')) {
            return $this->land_square . " " . tc("site_land_square");
        }

        return '';
    }

    public function getIsNewObject()
    {
        if ($this->oldStatus == self::STATUS_DRAFT && in_array($this->active, [self::STATUS_ACTIVE, self::STATUS_MODERATION])) {
            return true;
        } else {
            return false;
        }
    }

    public function getIsNeedModerate()
    {
        if (($this->oldStatus == self::STATUS_ACTIVE || $this->oldStatus == self::STATUS_DRAFT) && $this->active == self::STATUS_MODERATION) {
            return true;
        } else {
            return false;
        }
    }

    public function getFullTitleApartmentForChangeOwner()
    {
        return $this->getStrByLang('title') . ' ( ID: ' . $this->id . ')';
    }

    public function getMinMaxSeasonalPrices()
    {
        $tmp = array();
        foreach ($this->seasonalPrices as $item) {
            $tmp[] = $item->price;
        }

        $minSeasonalPrice = min($tmp);
        $maxSeasonalPrice = max($tmp);
        unset($tmp);

        return compact("minSeasonalPrice", "maxSeasonalPrice");
    }

    public static function convertType($priceType)
    {
        if (strpos($priceType, '-') !== false) {
            $typeArr = explode('-', $priceType);
            $type = (int)$typeArr[0];
        } else {
            $type = (int)$priceType;
        }
        return $type;
    }

    public function isChild()
    {
        return in_array($this->obj_type_id, ApartmentObjType::getChildIds());
    }

    public function forParent($id)
    {
        $this->getDbCriteria()->mergeWith(array(
            'condition' => $this->getTableAlias() . '.parent_id=:p_id',
            'params' => array(':p_id' => $id)
        ));

        return $this;
    }

    public function scopeChilds($in = 'grid')
    {
        $listExclude = ApartmentObjType::getListExclude($in);

        if ($listExclude) {
            $this->getDbCriteria()->mergeWith(array(
                'condition' => $this->getTableAlias() . '.obj_type_id NOT IN (' . implode(',', $listExclude) . ')',
            ));
        }

        return $this;
    }

    public function allowShowBookingCalendar()
    {
        if ($this->active != Apartment::STATUS_DRAFT && $this->type == Apartment::TYPE_RENT && $this->deleted == self::DELETED_NO) {
            if (isset($this->objType) && isset($this->objType->with_obj) && $this->objType->with_obj)
                return false;
            return true;
        }
        return false;
    }

    public function getCountComment()
    {
        return 0;
    }

    public function generateSeoTitles()
    {
        $langOld = Yii::app()->language;

        # Title формируется: тип сделки + тип недвижимости + адрес + сумма

        $activeLangs = Lang::getActiveLangs();
        if ($activeLangs && count($activeLangs)) {
            foreach ($activeLangs as $lang) {
                //setLang($lang);
                Yii::app()->setLanguage($lang);

                $titleArr = array();

                // тип сделки
                $types = HApartment::getTypesArray();
                $typeName = isset($types[$this->type]) ? $types[$this->type] : '';
                if (!empty($typeName)) {
                    $titleArr[] = $typeName;
                }

                // Тип недвижимости
                $objTypesNames = ApartmentObjType::getList('all', $lang, true);

                if (isset($objTypesNames[$this->obj_type_id])) {
                    $objTypeName = $objTypesNames[$this->obj_type_id];
                    if (!empty($titleArr)) {
                        $objTypeName = mb_strtolower($objTypeName, 'UTF-8');
                    }
                    $titleArr[] = $objTypeName;
                }

                // адрес
                $tmp = 'address_' . $lang;
                if (isset($this->$tmp) && $this->$tmp) {
                    $tmp = mb_strtolower($this->$tmp, 'UTF-8');

                    if ($lang != 'ru') {
                        $tmp = translit($tmp);
                    }

                    $titleArr[] = $tmp;
                }

                // цена
                if ($this->price) {
                    $defCurrId = Currency::getDefaultValuteId();
                    $defCurrName = $toCurrName = Currency::model()->findByPk($defCurrId)->char_code;

                    $currId = Lang::getCurrencyIdForLang($lang);
                    $toCurrName = Currency::model()->findByPk($currId)->char_code;

                    $abbrCurr = Lang::getCurrencyNameForLang($lang);

                    $priceValue = Currency::convert($this->price, $defCurrName, $toCurrName);
                    $priceValue = round($priceValue, param('round_price', 2));

                    $titleArr[] = mb_strtolower($priceValue . ' ' . $abbrCurr, 'UTF-8');
                }

                $title = '';
                if (!empty($titleArr)) {
                    $title = implode(', ', $titleArr);
                    unset($titleArr);
                }

                $this->setAttribute('title_' . $lang, $title);
            }
        }

        unset($activeLangs, $tmp);
        Yii::app()->setLanguage($langOld);
    }

    public function getCountComments()
    {
        return Yii::app()->db->createCommand("SELECT count(id) FROM {{comments}} WHERE model_name='Apartment' AND model_id=:id")->queryScalar(array(':id' => $this->id));
    }

    public function getDBFieldsToDefaultZero()
    {
        return [
            'square',
            'land_square',
            'parent_id',
            'open_plan',
            'room_type',
            'balcony_type',
            'wc_type',
            'floor_coat',
            'garage_type',
            'build_year',
            'repair',
            'object_state',
            'building_type',
            'plot_type',
            'square',
            'square',
        ];
    }

    /**
     * @return bool
     */
    public function isActive()
    {
        return ($this->deleted == self::DELETED_NO && $this->active == self::STATUS_ACTIVE && $this->owner_active == self::STATUS_ACTIVE);
    }

    /**
     * @return bool
     */
    public function isNotDeletedAndDraft()
    {
        return ($this->deleted != self::DELETED_NO && $this->active != self::STATUS_DRAFT);
    }

    protected function setDefaultCorrectDBValues()
    {
        if (!$this->is_free_to) {
            $this->is_free_to = null;
        }

        foreach ($this->getDBFieldsToDefaultZero() as $field) {
            if ($this->hasAttribute($field) && !$this->{$field}) {
                $this->{$field} = 0;
            }
        }
    }

    /**
     * @param  string  $scenario
     * @return CDbCriteria
     * @throws CException
     */
    public function buildBaseSearchCriteria($scenario = 'default')
    {
        $with = array();

        # слишком жирный запрос
        /*
        $with = array('objType', 'user', 'images');
        if (issetModule('seo')) {
            $with = CMap::mergeArray($with, array('seo', 'images.images_seo'));
        }
        if (issetModule('seasonalprices')) {
            $with = CMap::mergeArray($with, array('seasonalPrices'));
        }

        if (issetModule('location')) {
            $with = CMap::mergeArray($with, array('locCountry', 'locRegion', 'locCity'));
        } else {
            $with = CMap::mergeArray($with, array('city'));
        }*/

        $criteria = new CDbCriteria;
        $tmp = 'title_' . Yii::app()->language;
        $criteria->compare($this->getTableAlias() . '.' . $tmp, $this->$tmp, true);

        $criteria->compare($this->getTableAlias() . '.id', $this->id);

        if($scenario == 'default'){
            $criteria->compare($this->getTableAlias() . '.active', $this->active);
            $criteria->compare($this->getTableAlias() . '.owner_active', $this->owner_active);
            $criteria->compare($this->getTableAlias() . '.deleted', $this->deleted);
        }

        if (issetModule('location')) {
            if ($this->loc_country)
                $criteria->compare($this->getTableAlias() . '.loc_country', $this->loc_country);
            if ($this->loc_region)
                $criteria->compare($this->getTableAlias() . '.loc_region', $this->loc_region);
            if ($this->loc_city)
                $criteria->compare($this->getTableAlias() . '.loc_city', $this->loc_city);
        } else
            $criteria->compare($this->getTableAlias() . '.city_id', $this->city_id);

        if ($this->type != Apartment::TYPE_DISABLED && $this->type) {
            $criteria->compare($this->getTableAlias() . '.type', $this->type);
        } else {
            $criteria->addInCondition($this->getTableAlias() . '.type', HApartment::availableApTypesIds());
        }

        if ($this->obj_type_id)
            $criteria->compare($this->getTableAlias() . '.obj_type_id', $this->obj_type_id);

        if($this->visits){
            $criteria->compare($this->getTableAlias() . '.visits', $this->visits);
        }
        if($this->owner_id){
            $criteria->compare($this->getTableAlias() . '.owner_id', $this->owner_id);
        }

        if (issetModule('userads') && param('useModuleUserAds', 1)) {
            if ($this->ownerEmail) {
                $with = CMap::mergeArray($with, array('user'));
                $criteria->compare('user.email', $this->ownerEmail, true);
            }
        }
        if ($this->ownerUsername) {
            $with = CMap::mergeArray($with, array('user'));
            $criteria->compare('user.username', $this->ownerUsername, true);
        }

        if (issetModule('paidservices')) {
            $with = CMap::mergeArray($with, array('paids'));

            if ($this->searchPaidService) {
                $sql = 'SELECT apartment_id FROM {{apartment_paid}} WHERE paid_id = ' . (int)$this->searchPaidService . ' AND status = ' . ApartmentPaid::STATUS_ACTIVE . ' AND date_end >= NOW()';
                $paidApartments = Yii::app()->db->createCommand($sql)->queryColumn();

                if (!$paidApartments) {
                    $paidApartments = array(0);
                }

                $criteria->addInCondition($this->getTableAlias() . '.id', $paidApartments);
            }
        }

        $criteria = SearchHelper::genCriteria($this, $criteria, 'grid');

        $criteria->with = $with;

        return $criteria;
    }
}
