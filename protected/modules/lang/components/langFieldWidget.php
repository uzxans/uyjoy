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

class langFieldWidget extends CWidget
{

    public $model;
    public $modelName;
    public $field;
    public $fieldPrefix = '';
    public $labelSet = null;
    public $type = 'string';
    public $htmlOption;
    public $useTranslate = true;
    private $fieldIdArr = array();
    private $_activeLang;
    public $row_id = '';
    private static $_publishAsset;
    public $useCopyButton = true;
    public $useWyButton = false;
    public $note;
    private $uniqueKey;

    public function getViewPath($checkTheme = true)
    {
        if ($checkTheme && ($theme = Yii::app()->getTheme()) !== null) {
            if (is_dir($theme->getViewPath() . DIRECTORY_SEPARATOR . 'modules' . DIRECTORY_SEPARATOR . 'lang' . DIRECTORY_SEPARATOR . 'views'))
                return $theme->getViewPath() . DIRECTORY_SEPARATOR . 'modules' . DIRECTORY_SEPARATOR . 'lang' . DIRECTORY_SEPARATOR . 'views';
        }
        return Yii::getPathOfAlias('application.modules.lang.views');
    }

    public function run()
    {
        $this->modelName = get_class($this->model);

        $this->uniqueKey = $this->getId();

        $this->_activeLang = Lang::getActiveLangs(true);

        $countActiveLang = count($this->_activeLang);

        if ($countActiveLang <= 1 || in_array($this->type, array('text-editor'))) {
            $this->useTranslate = false;
        }
        if ($countActiveLang <= 1) {
            $this->useCopyButton = false;
        }

        if (($this->useTranslate || $this->useCopyButton) && !isset(self::$_publishAsset)) {
            self::$_publishAsset = true;
            $this->publishAssets();
        }

        $postfix = '_' . $this->uniqueKey . $this->field;

        if (count($this->_activeLang) == 1) {
            $first = reset($this->_activeLang);
            $fieldCurrent = $this->field . '_' . $first['name_iso'];
            echo $this->genContentTab($fieldCurrent, $first['name_iso']);
            return;
        }

        // Генерим массив и контент табов
        $i = 1;
        $activeI = 1;
        foreach ($this->_activeLang as $lang) {
            $fieldCurrent = $this->field . '_' . $lang['name_iso'];
            $tabs['tabs']['tab' . $i . $postfix] = array(
                'title' => '<img src="' . Yii::app()->getBaseUrl() . Lang::FLAG_DIR . $lang['flag_img'] . '">&nbsp;' . $lang['name'],
                'content' => $this->genContentTab($fieldCurrent, $lang['name_iso'])
            );
            if ($lang['name_iso'] == Yii::app()->language) {
                $activeI = $i;
            }
            $i++;
        }
        $tabs['activeTab'] = 'tab' . $activeI . $postfix;

        $this->widget('CTabView', $tabs);
    }

    private function genContentTab($field, $lang)
    {
        $isCKEditor = ($this->type == 'text-editor') ? 1 : 0;

        $fieldIdWithoutLang = 'id_' . $this->uniqueKey;
        $fieldId = $fieldIdWithoutLang . '_' . $lang;

        $html = '';

        if ($this->useTranslate) {
            $html .= '<div class="translate_button" >';
            $html .= '<span class="t_loader_' . $this->uniqueKey . '" style="display: none;"><img src="' . Yii::app()->theme->baseUrl . '/images/ajax-loader.gif" alt="Переводим"></span>';
            $html .= CHtml::button(tc('Translate'), array(
                'onClick' => "translateField('{$this->field}', '{$lang}', '{$isCKEditor}', " . CJavaScript::encode($this->uniqueKey) . ")"
            ));
            $html .= '</div>';
        }

        if ($this->useCopyButton) {
            $html .= '<div class="copylang_button">';
            $html .= CHtml::button(tc('Copy to all languages'), array(
                'onClick' => "copyField('{$this->field}', '{$lang}', '{$isCKEditor}', " . CJavaScript::encode($this->uniqueKey) . ")"
            ));
            $html .= '</div>';
        }

        // кнопки включения выключения редактора
        $statusOpt = 0;
        if ($this->useWyButton) {
            $statusOpt = LangWidgetOpt::getStatusForModel($this->model);
            $displayNone = 'display: none;';

            $html .= '<div class="editor_set_button">';
            $html .= CHtml::button(tc('WYSIWYG_apply'), array(
                'onClick' => "WYSIWYG_apply('{$fieldIdWithoutLang}', 1)",
                'style' => $statusOpt == LangWidgetOpt::STATUS_DESTROY ? '' : $displayNone,
                'id' => 'apply_btn_' . $fieldId,
                'data-mname' => $this->modelName,
                'data-mid' => $this->model->id,
            ));
            $html .= CHtml::button(tc('WYSIWYG_destroy'), array(
                'onClick' => "WYSIWYG_destroy('{$fieldIdWithoutLang}', 1)",
                'style' => $statusOpt == LangWidgetOpt::STATUS_SHOW ? '' : $displayNone,
                'id' => 'destroy_btn_' . $fieldId,
            ));
            $html .= '</div>';
        }

        $html .= '<div class="form-group">';
        if ($this->labelSet == null) {
            $html .= CHtml::activeLabel($this->model, $this->field, array('required' => $this->model->isLangAttributeRequired($this->field)));
        } else {
            $html .= CHtml::label($this->labelSet, $fieldId, array('required' => $this->model->isLangAttributeRequired($this->field)));
        }
        $html .= HApartment::getTip($this->field);

        if ($this->note) {
            $html .= CHtml::tag('p', array('class' => 'note'), $this->note);
        }

        $field = $this->fieldPrefix . $field;

        switch ($this->type) {
            case 'string':
                $html .= CHtml::activeTextField($this->model, $field, array(
                    'class' => 'width500 form-control',
                    'maxlength' => 255,
                    'id' => $fieldId
                ));
                break;

            case 'text':
                $html .= CHtml::activeTextArea($this->model, $field, array(
                    'class' => 'width500 height200 form-control',
                    'id' => $fieldId
                ));
                break;

            case 'text-editor':
                $html .= '<div class="clear"></div>';

                $html .= $this->widget('CustomEditor', array(
                    'model' => $this->model,
                    'attribute' => $field,
                    'onlyLoadAssets' => ($this->useWyButton && $statusOpt == LangWidgetOpt::STATUS_DESTROY),
                    'htmlOptions' => array('id' => $fieldId, 'class' => 'form-control')
                ), true);
                break;
        }

        $html .= CHtml::error($this->model, $field);
        $html .= '</div>';

        $this->fieldIdArr[$lang] = $fieldId;

        return $html;
    }

    public function publishAssets()
    {
        $assets = dirname(__FILE__) . '/../assets';
        $baseUrl = Yii::app()->assetManager->publish($assets);

        if (is_dir($assets)) {
            Yii::app()->clientScript->registerCoreScript('jquery');
            Yii::app()->clientScript->registerScript(__CLASS__, "
			var activeLang = " . CJavaScript::encode(Lang::getActiveLangs()) . ";
			var baseUrl = '" . Yii::app()->request->baseUrl . "';
			var errorNoFromLang = '" . Yii::t('module_lang', 'Enter a value for this language') . "';
			var errorTranslate = '" . Yii::t('module_lang', 'Error translate') . "';
			var successTranslate = '" . Yii::t('module_lang', 'Success translate') . "';
			var successCopy = '" . Yii::t('module_lang', 'Success copy') . "';
		", CClientScript::POS_END);

            Yii::app()->clientScript->registerScriptFile($baseUrl . '/translate.js', CClientScript::POS_END);
        } else {
            throw new Exception(Yii::t('common', 'Lang - Error: Couldn\'t find assets folder to publish.'));
        }
    }
}
