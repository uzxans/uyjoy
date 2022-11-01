<?php
$this->breadcrumbs = array(
    tt('Booking apartment'),
);

$this->pageTitle = tt('Booking apartment');
?>

<?php if (!Yii::app()->user->hasFlash('success')): ?>

    <div class="form min-fancy-width <?php echo (isset($isFancy) && $isFancy) ? 'max-fancy-width white-popup-block' : ''; ?>">
        <?php $form = $this->beginWidget('CustomActiveForm', array(
            'action' => Yii::app()->controller->createUrl('/booking/main/mainform'),
            'enableAjaxValidation' => false,
            'htmlOptions' => array('class' => 'form-disable-button-after-submit'),
        )); ?>
        <div class="title highlight-left-right">
            <div>
                <h1><?php echo tt('Booking apartment'); ?></h1>
            </div>
        </div>
        <div class="clear"></div>
        <br/>

        <p class="note"><?php echo Yii::t('common', 'Fields with <span class="required">*</span> are required.'); ?></p>
        <?php echo $form->errorSummary($model); ?>

        <div class="row">
            <?php echo $form->labelEx($model, 'type'); ?>
            <?php echo $form->dropDownList($model, 'type', $type, array('class' => 'width200', 'id' => 'booking_ap_type', 'onChange' => 'apTypeChange(this)')); ?>
            <?php echo $form->error($model, 'type'); ?>
        </div>

        <?php
        $this->renderPartial('_form', array(
            'model' => $model,
            'form' => $form,
            'isGuest' => Yii::app()->user->isGuest,
            'isSimpleForm' => true,
            'user' => $user,
        ));
        ?>

        <div class="row buttons">
            <?php echo CHtml::hiddenField('isForBuy', 0, array('id' => 'isForBuy')); ?>
            <div class="block-afree-to-user-afreement">
                <?php echo Yii::t('common', 'By clicking "{buttonName}", you agree to our <a href="{licenceUrl}" target="_blank">User agreement</a>', array('{buttonName}' => Yii::t('common', 'Send'), '{licenceUrl}' => InfoPages::getUrlById(InfoPages::LICENCE_PAGE_ID))); ?>
            </div>
            <?php
            echo CHtml::submitButton(Yii::t('common', 'Send'), array('class' => 'button-blue submit-button'));
            ?>
        </div>
        <?php $this->endWidget(); ?>
    </div>
<?php endif; ?>

<?php
Yii::app()->clientScript->registerScript('show-rent-form', '
		if (document.getElementById("booking_ap_type")) {
			var apTypeValue = document.getElementById("booking_ap_type").value;

			if (apTypeValue != ' . Apartment::TYPE_RENTING . ') {
				document.getElementById("rent_form").style.display = "none";
				document.getElementById("isForBuy").value = 1;
			}

			function apTypeChange(control) {
				if (control.value == ' . Apartment::TYPE_RENTING . ') {
					document.getElementById("rent_form").style.display = "";
					document.getElementById("isForBuy").value = 0;
				}
				else {
					document.getElementById("rent_form").style.display = "none";
					document.getElementById("isForBuy").value = 1;
				}
			}
		}
	', CClientScript::POS_END);
