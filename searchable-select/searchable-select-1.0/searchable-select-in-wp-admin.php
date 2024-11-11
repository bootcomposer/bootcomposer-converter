<?php
/*
Plugin Name: Searchable Select at Admin (BootComposer)
Description: Adds and initializes Select2 for all select elements in the WordPress admin dashboard.
Version: 1.0
Author: BootComposer Contributors
Author URI: https://bootcomposer.org
*/

// Prevent direct access to the file
if (!defined('ABSPATH')) {
    exit;
}

// Enqueue Select2 CSS and JS in the admin dashboard
function admin_select2_enqueue_scripts() {
    // Enqueue Select2 CSS
    wp_enqueue_style('select2-css', 'https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css');
    
    // Enqueue Select2 JS
    wp_enqueue_script('select2-js', 'https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.full.min.js', array('jquery'), '4.0.13', true);

    // Add custom JS to initialize Select2
    wp_add_inline_script('select2-js', "
        jQuery(document).ready(function($) {
            $('select').select2();
        });
    ");
}
add_action('admin_enqueue_scripts', 'admin_select2_enqueue_scripts');
