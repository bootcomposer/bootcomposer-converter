<?php
/*
Plugin Name: Pace.js Loader BootComposer
Description: Adds the Pace.js loader to the WordPress admin area.
Version: 1.0
Author: BootCompsoser Contributers
*/

// Hook to enqueue Pace.js on the admin screen
function add_pace_js_to_admin() {
    // Enqueue Pace.js
    wp_enqueue_script(
        'pace-js',
        'https://cdnjs.cloudflare.com/ajax/libs/pace/1.0.2/pace.min.js',
        [],
        '1.0.2',
        true
    );

    // Enqueue Pace.js theme CSS (optional: change theme to any available Pace theme)
    wp_enqueue_style(
        'pace-js-style',
        'https://cdnjs.cloudflare.com/ajax/libs/pace/1.0.2/themes/blue/pace-theme-minimal.min.css',
        [],
        '1.0.2'
    );
}
add_action('admin_enqueue_scripts', 'add_pace_js_to_admin');
