<?php $languages = (!isFree()) ? Lang::getActiveLangs(true) : null; ?>

<p>
    <?php
    if (param('useBootstrap')) {
        echo AdminLteHelper::getEditButton(tc('Friendly URL and SEO settings'), 'javascript:void(0);', array(
            'onclick' => 'js:$("#seo_dialog").dialog("open");',
        ));
    } else {
        echo CHtml::link(tc('Friendly URL and SEO settings'), 'javascript:void(0);', array(
            'onclick' => 'js:$("#seo_dialog").dialog("open");',
            'class' => 'set-item-seo-settings',
        ));
    }

    ?>
</p>

<?php
$this->beginWidget('zii.widgets.jui.CJuiDialog', array(
    'id' => 'seo_dialog',
    'options' => array(
        'autoOpen' => false,
        'width' => '700px',
        'modal' => $showBodyTextField ? false : true,
        'resizable' => true,
        'closeOnEscape' => true,
    ),
));
?>

<div class="form" id="seo_url_html">

    <?php $this->render('_form', array('friendlyUrl' => $friendlyUrl, 'showBodyTextField' => $showBodyTextField)); ?>

</div><!-- form -->

<?php $this->endWidget('zii.widgets.jui.CJuiDialog'); ?>

<script type="text/javascript">
    function saveSeoUrl() {
        var dataPost = $('#seo_url_form').serialize();

        $.ajax({
            url: '<?php echo Yii::app()->createUrl('/seo/main/ajaxSave'); ?>',
            dataType: 'json',
            type: 'post',
            data: dataPost,
            success: function (data) {
                if (data.status == 'ok') {
                    $("#seo_dialog").dialog("close");
                    message('<?php echo tc('Success'); ?>');
                    $('#seo_url_html').html(data.html);
                    <?php if ($languages && count($languages) > 1):?>
                    $(".yiiTab").yiitab();
                    <?php endif;?>
                    return;
                } else {
                    error('<?php echo tc("Error"); ?>');
                    $('#seo_url_html').html(data.html);
                    <?php if ($languages && count($languages) > 1):?>
                    $(".yiiTab").yiitab();
                    <?php endif;?>
                    return;
                }
            },
            error: function (data) {
                error('<?php echo tc("Error. Repeat attempt later"); ?>');
            }
        });
    }
</script>