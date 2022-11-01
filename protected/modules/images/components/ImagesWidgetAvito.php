<?php
/* * ********************************************************************************************
 * 								Open Real Estate
 * 								----------------
 * 	version				:	V1.19.1
 * 	copyright			:	(c) 2016 Monoray
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

class ImagesWidgetAvito extends CWidget
{

    public $objectId;
    public $width;
    public $height;
    public $images;
    public $withMain = false;
    public $useFotorama = true;

    public function getViewPath($checkTheme = true)
    {
        if ($checkTheme && ($theme = Yii::app()->getTheme()) !== null) {
            if (is_dir($theme->getViewPath() . DIRECTORY_SEPARATOR . 'modules' . DIRECTORY_SEPARATOR . 'images' . DIRECTORY_SEPARATOR . 'views'))
                return $theme->getViewPath() . DIRECTORY_SEPARATOR . 'modules' . DIRECTORY_SEPARATOR . 'images' . DIRECTORY_SEPARATOR . 'views';
        }
        return Yii::getPathOfAlias('application.modules.images.views');
    }

    public function run()
    {
        //$this->registerAssets();

        if (!$this->images) {
            $sql = 'SELECT id, file_name, id_object, file_name_modified, is_main FROM {{images}} WHERE id_object=:id ORDER BY sorter';
            $this->images = Images::model()->findAllBySql($sql, array(':id' => $this->objectId));
        }

        $this->render('widgetImagesAvito', array(
            'images' => $this->images,
        ));
    }

    public function registerAssets()
    {
        $assets = dirname(__FILE__) . '/../assets';
        $baseUrl = Yii::app()->assetManager->publish($assets);

        if (is_dir($assets)) {
            if ($this->useFotorama) {
                Yii::app()->clientScript->registerCoreScript('jquery');
                Yii::app()->clientScript->registerCssFile($baseUrl . '/fotorama/fotorama.css');
                Yii::app()->clientScript->registerScriptFile($baseUrl . '/fotorama/fotorama.js');
            } else {
                Yii::app()->clientScript->registerCoreScript('jquery');
                Yii::app()->clientScript->registerCssFile($baseUrl . '/prettyphoto/css/prettyPhoto.css');
                Yii::app()->clientScript->registerScriptFile($baseUrl . '/prettyphoto/js/jquery.prettyPhoto.js');
                Yii::app()->clientScript->registerScript('prettyPhotoInit', '
				$("a[data-gal^=\'prettyPhoto\']").prettyPhoto(
					{
						animation_speed: "fast",
						slideshow: 10000,
						hideflash: true,
						social_tools: "",
						gallery_markup: "",
						slideshow: 3000,
						autoplay_slideshow: false,
						deeplinking: false,
						hook: "data-gal"
						/*slideshow: false*/
					}
				);
			', CClientScript::POS_READY);
            }
        } else {
            throw new Exception('Image - Error: Couldn\'t find assets folder to publish.');
        }
    }
}
