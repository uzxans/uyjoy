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

class EntriesImage extends ParentModel
{

    public $imageInstance = null;
    public $path = 'webroot.uploads.entries';

    const SMALL_THUMB_WIDTH = 115;
    const SMALL_THUMB_HEIGHT = 115;
    const FULL_THUMB_WIDTH = 480;
    const FULL_THUMB_HEIGHT = 480;

    public static function model($className = __CLASS__)
    {
        return parent::model($className);
    }

    public function tableName()
    {
        return '{{entries_image}}';
    }

    public function rules()
    {
        return array();
    }

    public function relations()
    {
        $relations = array();
        if (issetModule('seo')) {
            $relations['image_seo'] = array(self::HAS_ONE, 'SeoFriendlyUrl', 'model_id', 'on' => 'model_name="EntriesImage"', 'alias' => 'image_seo');
        }

        $relations['entry'] = array(self::HAS_ONE, 'Entries', 'image_id');

        return $relations;
    }

    public function seoFields()
    {
        return array();
    }

    public function fullHref()
    {
        return Yii::app()->getBaseUrl(true) . '/uploads/entries/' . $this->name;
    }

    public function getThumb($width, $height, $adaptive = false)
    {
        $path = Yii::getPathOfAlias($this->path);
        $filePath = $path . DIRECTORY_SEPARATOR . 'thumb_' . $width . 'x' . $height . "_" . $this->name;
        $fileName = 'thumb_' . $width . 'x' . $height . "_" . $this->name;
        if (file_exists($filePath)) {
            return $fileName;
        } else {
            $image = new CImageHandler();
            if ($image->load($path . DIRECTORY_SEPARATOR . $this->name)) {
                if ($adaptive) {
                    $image->adaptiveThumb($width, $height)->save($filePath, false, param('thumbQuality', 75));
                } else {
                    $image->thumb($width, $height)->save($filePath, false, param('thumbQuality', 75));
                }
                return $fileName;
            }
            return null;
        }
    }

    public function getFullThumbLink()
    {
        $name = $this->getThumb(self::FULL_THUMB_WIDTH, self::FULL_THUMB_HEIGHT);
        if ($name !== null) {
            return Yii::app()->getBaseUrl(true) . '/uploads/entries/' . $name;
        } else {
            return null;
        }
    }

    public function getSmallThumbLink()
    {
        $name = $this->getThumb(self::SMALL_THUMB_WIDTH, self::SMALL_THUMB_HEIGHT);
        if ($name !== null) {
            return Yii::app()->getBaseUrl(true) . '/uploads/entries/' . $name;
        } else {
            return null;
        }
    }

    public function beforeSave()
    {
        if ($this->imageInstance) {
            $path = Yii::getPathOfAlias($this->path);
            $name = $this->imageInstance->getName();

            $fileName = pathinfo($name, PATHINFO_FILENAME);
            $fileExt = pathinfo($name, PATHINFO_EXTENSION);

            $name = translit($fileName) . '.' . $fileExt;

            while (file_exists($path . DIRECTORY_SEPARATOR . $name)) {
                $name = rand(0, 9) . $name;
            }

            if ($this->imageInstance->saveAs($path . DIRECTORY_SEPARATOR . $name)) {
                $resultMemoryCheck = HSite::allowUploadAndResizeImage($path . DIRECTORY_SEPARATOR . $name);

                if ($resultMemoryCheck['result'] === true) {
                    $this->name = $name;
                } else {
                    $this->name = '';

                    @unlink($path . DIRECTORY_SEPARATOR . $name);
                    Yii::app()->user->setFlash(
                        'danger', tc('Upload failed. To upload image please increase the amount of RAM in your hosting.') . '(Minimum: ' . $resultMemoryCheck['memoryImageNeededInMB'] . 'MB)'
                    );
                }
            } else {
                return false;
            }
        }

        return parent::beforeSave();
    }

    public function beforeDelete()
    {
        if (issetModule('seo')) {
            $sql = 'DELETE FROM {{seo_friendly_url}} WHERE model_id="' . $this->id . '" AND model_name = "EntriesImage"';
            Yii::app()->db->createCommand($sql)->execute();
        }

        @unlink(Yii::getPathOfAlias($this->path) . DIRECTORY_SEPARATOR . $this->name);

        $fileName = 'thumb_' . self::FULL_THUMB_WIDTH . 'x' . self::FULL_THUMB_HEIGHT . "_" . $this->name;
        @unlink(Yii::getPathOfAlias($this->path) . DIRECTORY_SEPARATOR . $fileName);

        return parent::beforeDelete();
    }

    public function behaviors()
    {
        $arr = array();
        $arr['AutoTimestampBehavior'] = array(
            'class' => 'zii.behaviors.CTimestampBehavior',
            'createAttribute' => 'date_created',
            'updateAttribute' => null,
        );
        if (issetModule('historyChanges')) {
            $arr['ArLogBehavior'] = array(
                'class' => 'application.modules.historyChanges.components.ArLogBehavior',
            );
        }

        return $arr;
    }
}
