<?php
$this->pageTitle .= ' - ' . SitemapModule::t('Site map');
$this->breadcrumbs = array(
    SitemapModule::t('Site map'),
);
?>

<div class="title highlight-left-right">
    <div><h1><?php echo SitemapModule::t('Site map'); ?></h1></div>
</div>
<div class="clear"></div><br/>

<div class="site-map-main">
    <?php

    if ($map && count($map) > 0) {
        echo '<ul class="site_map">';
        foreach ($map as $item) {
            if (isset($item['title'])) {
                echo '<li>';
                if (isset($item['url'])) {
                    echo '<a href="' . $item['url'] . '">';
                }
                echo $item['title'];
                if (isset($item['url'])) {
                    echo '</a>';
                }
                echo '</li>';
            }
            if (isset($item['subsection']) && count($item['subsection']) > 0) {
                echo '<ul class="sm_subsection">';
                foreach ($item['subsection'] as $value) {
                    if (isset($value['url']) && is_array($value['url'])) {
                        continue;
                    }

                    if (isset($value['title'])) {
                        echo '<li>';
                        if (isset($value['url'])) {
                            echo '<a href="' . $value['url'] . '">';
                        }
                        echo $value['title'];
                        if (isset($value['url'])) {
                            echo '</a>';
                        }
                        echo '</li>';
                    }
                }
                echo '</ul>';
            }
        }
        echo '</ul>';
    }

    if($config){
        echo $config->getStrByLang('body');
    }

    ?>

</div>