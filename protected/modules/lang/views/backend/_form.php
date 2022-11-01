<div class="form">

    <?php
    Yii::app()->user->setFlash('help', Yii::t('module_lang', 'help upload icon', array('flag_dir' => Lang::FLAG_DIR)));

    Lang::publishAssetsDD();

    $form = $this->beginWidget('CustomForm', array(
        'id' => $this->modelName . '-form',
        'enableAjaxValidation' => false,
        'htmlOptions' => array('class' => 'well form-disable-button-after-submit'),
    ));

    ?>

    <p class="note"><?php echo Yii::t('common', 'Fields with <span class="required">*</span> are required.'); ?></p>

    <?php echo $form->errorSummary($model); ?>

    <div class="form-group">
        <?php echo $form->labelEx($model, 'flag_img'); ?>
        <?php
        $flags = Lang::getFlagImgArray();
        echo '<select name="Lang[flag_img]" id="flag_img">';
        foreach ($flags as $flag => $name) {
            $selected = $model->flag_img == $flag ? 'selected="selected"' : '';
            echo '<option ' . $selected . ' value="' . $flag . '" title="' . Yii::app()->baseUrl . Lang::FLAG_DIR . $flag . '">' . ($name ? $name : $flag) . '</option>';
        }
        echo '</select>';

        ?>
        <?php echo $form->error($model, 'flag_img'); ?>
    </div>

    <br/>

    <?php if ($model->isNewRecord) { ?>

        <div class="form-group">
            <?php echo $form->labelEx($model, 'name_iso'); ?>
            <?php echo $form->dropDownList($model, 'name_iso', Lang::getISOlangForAdd()); ?>
            <?php echo $form->error($model, 'name_iso'); ?>
        </div>

        <br/>

        <?php
        $activeLangs = Lang::getActiveLangsTranslated();

        ?>

        <div class="form-group">
            <?php echo $form->labelEx($model, 'copy_lang_from'); ?>
            <?php echo $form->dropDownList($model, 'copy_lang_from', $activeLangs, array('class' => 'width150')); ?>
            <?php echo $form->error($model, 'copy_lang_from'); ?>
        </div>

    <?php } else { ?>
        <div class="form-group">
            <b><?php echo tt('Name ISO'); ?></b>: <?php echo $model->name_iso . ((Lang::getISOname($model->name_iso)) ? ' (' . Lang::getISOname($model->name_iso) . ')' : ''); ?>
        </div>
    <?php } ?>

    <div class="form-group">
        <?php echo $form->labelEx($model, 'currency_id'); ?>
        <?php echo $form->dropDownList($model, 'currency_id', Currency::getCurrencyArray(true), array('class' => 'width150')); ?>
        <?php echo $form->error($model, 'currency_id'); ?>
    </div>

    <div class="form-group">
        <?php echo $form->textFieldControlGroup($model, 'dateFormat'); ?>
    </div>

    <?php
    $this->widget('application.modules.lang.components.langFieldWidget', array(
        'model' => $model,
        'field' => 'name',
        'type' => 'string'
    ));

    ?>

    <div class="clear"></div>

    <div class="form-group">
        <?php echo $form->checkboxControlGroup($model, 'isRTL'); ?>
    </div>

    <div class="form-group">
        <?php if (!$model->price_tpl_default) {
            $model->price_tpl_default = Lang::$_defaultDataDefault;
        }
        ?>
        <?php echo $form->textFieldControlGroup($model, 'price_tpl_default'); ?>
    </div>

    <div class="form-group">
        <?php if (!$model->price_tpl_from) {
            $model->price_tpl_from = Lang::$_defaultDataFrom;
        }
        ?>
        <?php echo $form->textFieldControlGroup($model, 'price_tpl_from'); ?>
    </div>

    <div class="form-group">
        <?php if (!$model->price_tpl_to) {
            $model->price_tpl_to = Lang::$_defaultDataTo;
        }
        ?>
        <?php echo $form->textFieldControlGroup($model, 'price_tpl_to'); ?>
    </div>

    <div class="form-group">
        <?php echo $form->textFieldControlGroup($model, 'priceDecimalsPoint'); ?>
    </div>

    <div class="form-group">
        <?php echo $form->textFieldControlGroup($model, 'priceThousandsSeparator'); ?>
    </div>

    <div class="form-group buttons">
        <?php
        echo AdminLteHelper::getSubmitButton($model->isNewRecord ? tc('Add') : tc('Save'));

        ?>
    </div>

    <?php $this->endWidget(); ?>

</div><!-- form -->

<script type="text/javascript">
    $(document).ready(function (e) {
        try {
            $("#flag_img").msDropDown();
        } catch (e) {
            alert(e.message);
        }
    });
</script>
