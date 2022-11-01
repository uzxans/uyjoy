<?php
if (/*param('useBootstrap')*/
Yii::app()->user->checkAccess('backend_access')) { # admin panel
    $this->breadcrumbs = array(
        tt('Manage apartments', 'apartments') => array('admin'),
        tt('Update apartment', 'apartments'),
    );

    $this->menu = array(
        array('label' => tt('Manage apartments', 'apartments'), 'url' => array('/apartments/backend/main/admin')),
        array('label' => tt('Update apartment', 'apartments'), 'url' => array('/apartments/backend/main/update', 'id' => $apartment->id)),
    );

    $this->adminTitle = tt('Update seasonal price', 'seasonalprices');

    # for datepicker - only styles
    Yii::app()->clientScript->registerCssFile(Yii::app()->clientScript->getCoreScriptUrl() . '/jui/css/base/jquery-ui.css');
} else { # userpanel
    $this->pageTitle .= ' - ' . tt('Update seasonal price', 'seasonalprices');
    $this->breadcrumbs = array(
        Yii::t('common', 'Control panel') => array('/usercpanel/main/index'),
        tt('Update seasonal price', 'seasonalprices')
    );

    $this->menu = array(
        array('label' => tt('Manage apartments', 'apartments'), 'url' => array('/userads/main/index')),
        array('label' => tt('Update apartment', 'apartments'), 'url' => array('/userads/main/update', 'id' => $apartment->id)),
    );

    $this->pageTitle = tt('Update seasonal price', 'seasonalprices');

    echo '<div class="title highlight-left-right"><div><h1>' . tt('Update seasonal price', 'seasonalprices') . '</h1></div></div>';
}
?>

<div class="form form-seasonalprices-update">
    <?php $form = $this->beginWidget('CustomActiveForm', array(
        'id' => $this->modelName . '-form',
        'enableAjaxValidation' => true,
        'htmlOptions' => array('class' => 'well form-disable-button-after-submit')
    )); ?>

    <p class="note"><?php echo Yii::t('common', 'Fields with <span class="required">*</span> are required.'); ?></p>
    <input type="hidden" name="id" id="seasonal_id_value" value="<?php echo $seasonalPricesModel->id; ?>">

    <?php echo $form->errorSummary($seasonalPricesModel); ?>

    <?php
    echo $this->renderPartial('_form',
        array(
            'seasonalPricesModel' => $seasonalPricesModel,
            'form' => $form,
            'apartment' => $apartment,
            'showPricesTable' => false,
            'showAddButton' => false,
            'showHelp' => false,
            'setDatepickerDate' => $setDatepickerDate,
            'datepickerDateStart' => $datepickerDateStart,
            'datepickerDateEnd' => $datepickerDateEnd,
        )
    );
    ?>

    <?php if (Yii::app()->user->checkAccess('backend_access')): ?>
        <div class="form-group buttons">
            <?php echo $this->widget('bootstrap.widgets.TbButton',
                array('buttonType' => 'submit',
                    'type' => 'primary',
                    'icon' => 'ok white',
                    'label' => tc('Save'),
                    'htmlOptions' => array(
                        'class' => 'btn btn-primary submit-button',
                    ),
                )); ?>
        </div>
    <?php else: ?>
        <div class="row buttons save">
            <?php echo CHtml::submitButton(tc('Save'), array('class' => 'big_button button-blue submit-button')); ?>
        </div>
    <?php endif; ?>

    <?php $this->endWidget(); ?>
</div><!-- form -->