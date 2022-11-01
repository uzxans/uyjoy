<?php
$this->pageTitle = Yii::app()->name . ' - ' . Yii::t('common', 'Recover password');
$this->breadcrumbs = array(
    Yii::t('common', 'Recover password')
);
?>

<div class="title highlight-left-right">
    <div>
        <h1><?php echo Yii::t('common', 'Recover password'); ?></h1>
    </div>
</div>
<div class="clear"></div><br/>

<div class="form">
    <?php $form = $this->beginWidget('CustomActiveForm', array(
        'id' => 'recover-form',
        'enableClientValidation' => false,
        'htmlOptions' => array('class' => 'form-disable-button-after-submit'),
        /*'clientOptions'=>array(
            'validateOnSubmit'=>true,
        ),*/
    )); ?>

    <p class="note"><?php echo Yii::t('common', 'Fields with <span class="required">*</span> are required.'); ?></p>

    <div class="row">
        <?php echo tc('recover_pass_form_help'); ?>
    </div>

    <div class="row">
        <?php echo $form->labelEx($model, 'email'); ?>
        <?php echo $form->textField($model, 'email'); ?>
        <?php echo $form->error($model, 'email'); ?>
    </div>

    <div class="row">
        <?php echo $form->labelEx($model, 'verifyCode'); ?>
        <?php $display = (param('useReCaptcha', 0)) ? 'none;' : 'block;' ?>
        <?php echo $form->textField($model, 'verifyCode', array('autocomplete' => 'off', 'style' => "display: {$display}")); ?>
        <br/>
        <?php $this->widget('CustomCaptchaFactory',
            array(
                'captchaAction' => '/site/captcha',
                'buttonOptions' => array('class' => 'get-new-ver-code'),
                'clickableImage' => true,
                'imageOptions' => array('id' => 'recover_captcha'),
                'model' => $model,
                'attribute' => 'verifyCode',
            )
        ); ?>
        <?php echo $form->error($model, 'verifyCode'); ?>
        <br/>
    </div>

    <div class="row buttons">
        <?php echo CHtml::submitButton(Yii::t('common', 'Recover'), array('class' => 'button-blue submit-button')); ?>
    </div>

    <?php $this->endWidget(); ?>
</div><!-- form -->
