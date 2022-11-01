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

class MainController extends ModuleAdminController
{

    public $modelName = 'ImageSettings';

    public function accessRules()
    {
        return array(
            array('allow',
                'expression' => "Yii::app()->user->checkAccess('all_settings_admin')",
            ),
            array('deny',
                'users' => array('*'),
            ),
        );
    }

    public function actionIndex()
    {
        $model = new $this->modelName;

        if (isset($_POST[$this->modelName])) {
            $model->attributes = $_POST[$this->modelName];

            if ($model->validate()) {
                $model->save();

                Yii::app()->configuration->init();

                Yii::app()->user->setFlash('success', tc('Success'));
            }
        }

        $this->render('index', array('model' => $model));
    }

    public function actionConvert()
    {
        # после вызвать actionSetCount
        # или
        #
        /*
          UPDATE `ore_xy_apartment` p, ( SELECT id_object, COUNT(id) as mysum
          FROM `ore_xy_images` GROUP BY id_object) as s
          SET p.count_img = s.mysum
          WHERE p.id = s.id_object
         */

        @set_time_limit(0);
        @ini_set('max_execution_time', 0);
        @ini_set('gd.jpeg_ignore_warning', 1);

        $limit = 200;

        $data = Yii::app()->statePersister->load();
        $lastImportId = isset($data['last_import_id']) ? $data['last_import_id'] : 0;

        $sql = 'SELECT id, owner_id FROM {{apartment}} WHERE id > ' . $lastImportId . ' LIMIT ' . $limit;
        $res = Yii::app()->db->createCommand($sql)->queryAll();
        $ids = CHtml::listData($res, 'id', 'owner_id');

        $sql = 'SELECT pid, imgsOrder FROM {{galleries}} WHERE pid > ' . $lastImportId . ' LIMIT ' . $limit;
        $res = Yii::app()->db->createCommand($sql)->queryAll();

        $i = 0;
        if ($res) {
            foreach ($res as $item) {
                $images = unserialize($item['imgsOrder']);
                if (!isset($ids[$item['pid']])) {
                    continue;
                }
                if ($images) {
                    $cnt = 0;
                    foreach ($images as $image => $name) {
                        $filePath = Yii::getPathOfAlias('webroot.uploads.apartments.' . $item['pid'] . '.pictures') . '/' . $image;
                        try {
                            Images::addImage($filePath, $item['pid'], ($cnt == 0), $ids[$item['pid']]);
                        } catch (Exception $e) {
                            echo '<b>Выброшено исключение: ', $e->getMessage(), "\n</b><br>";
                        }
                        $cnt++;
                    }
                }

                $data['last_import_id'] = $item['pid'];
                Yii::app()->statePersister->save($data);
                $i++;
                if ($i >= $limit) {
                    break;
                }
            }
        }
        echo 'Converted ' . $i . ' ads';
    }

    public function actionSetCount()
    {
        $sql = "SELECT COUNT(id) AS count_img, id_object FROM {{images}} GROUP BY id_object";
        $res = Yii::app()->db->createCommand($sql)->queryAll();

        foreach ($res as $item) {
            $model = Apartment::model()->findByPk($item['id_object']);
            if ($model) {
                $model->count_img = $item['count_img'];
                $model->update(array('count_img'));
            } else {
                echo 'not found model with id = ' . $item['id_object'] . '<br>';
            }
        }

        deb($res);
    }

    public function actionDeleteImg()
    {
        $mId = Yii::app()->request->getParam('mid');
        $id = Yii::app()->request->getParam('id');
        $redirectUrl = Yii::app()->request->getParam('rUrl');

        if ($id) {
            $model = ObjectImage::model()->findByPk($id);
            if ($model->model_id != $mId)
                throw404();

            $model->delete();
            $this->redirect($redirectUrl);
        }
        throw404();
    }
}
