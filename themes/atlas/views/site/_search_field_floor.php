<div class="<?php echo $divClass; ?>">
    <?php if (issetModule('selecttoslider') && param('useFloorSlider') == 1) { ?>
        <div class="<?php echo $textClass; ?>"><?php echo Yii::t('common', 'Floor range'); ?>:</div>
        <div class="<?php echo $controlClass; ?>">
            <?php
            $floorItems = array_merge(
                range(0, param('moduleApartments_maxFloor', 30))
            );
            $floorMin = isset($this->floorCountMin) ? CHtml::encode($this->floorCountMin) : 0;
            $floorMax = isset($this->floorCountMax) ? CHtml::encode($this->floorCountMax) : max($floorItems);

            SearchForm::renderSliderRange(array(
                'field' => 'floor',
                'min' => 0,
                'max' => param('moduleApartments_maxFloor', 30),
                'min_sel' => $floorMin,
                'max_sel' => $floorMax,
                'step' => 1,
                'class' => 'floor-search-select',
            ));
            ?>
        </div>
    <?php } else { ?>
        <?php if ($this->searchShowLabel) { ?>
            <div class="<?php echo $textClass; ?>"><?php echo tc('Floor'); ?>:</div>
        <?php } ?>

        <?php
        $floorMin = isset($this->floorCountMin) ? CHtml::encode($this->floorCountMin) : '';
        $floorMax = isset($this->floorCountMax) ? CHtml::encode($this->floorCountMax) : '';
        ?>

        <div class="<?php echo $controlClass; ?>">
            <input onblur="changeSearch();" type="number" id="floorMin" name="floor_min"
                   class="width120 search-input-new" placeholder="<?php echo tc('Floor from') ?>"
                   value="<?php echo CHtml::encode($floorMin); ?>"/>&nbsp;
            <input onblur="changeSearch();" type="number" id="floorMax" name="floor_max"
                   class="width120 search-input-new" placeholder="<?php echo tc('Floor to') ?>"
                   value="<?php echo CHtml::encode($floorMax); ?>"/>&nbsp;
        </div>


        <?php
        Yii::app()->clientScript->registerScript('squareFocusSubmit', '
				jQuery(function($) {
					focusSubmit($("input#floorMin"));
					focusSubmit($("input#floorMax"));
				});
			', CClientScript::POS_END, array(), true);
    }
    ?>
</div>
