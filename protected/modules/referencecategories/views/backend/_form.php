<div class="form">

    <?php
    $form = $this->beginWidget('CustomForm', array(
        'id' => $this->modelName . '-form',
        'enableAjaxValidation' => true,
        'htmlOptions' => array('class' => 'well form-disable-button-after-submit'),
    ));
    echo CHtml::hiddenField('addValues', 0, array('id' => 'addValues'));

    ?>

    <p class="note"><?php echo Yii::t('common', 'Fields with <span class="required">*</span> are required.'); ?></p>

    <?php echo $form->errorSummary($model); ?>

    <?php
    $this->widget('application.modules.lang.components.langFieldWidget', array(
        'model' => $model,
        'field' => 'title',
        'type' => 'string'
    ));

    if (issetModule('formeditor')) {
        echo $form->dropDownListControlGroup($model, 'type', ReferenceCategories::getTypeList());
    }
    ?>

    <div class="form-group buttons">
        <?php
        echo AdminLteHelper::getSubmitButton(tc('Save'));

        ?>
        <?php
        if ($model->isNewRecord) {
            echo AdminLteHelper::getSubmitButton(tt('Save and add values'), array(
                'onclick' => '$("#addValues").val(1)',
            ));
        }

        ?>
    </div>

    <?php $this->endWidget(); ?>

</div><!-- form -->