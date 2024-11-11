<?php
/**
 * Plugin Name:  BootComposer Converter
 * Plugin URI: https://bootcomposer.org
 * Description: Master plugin that will convert WordPress to BootComposer by including latest versions of all other underlying plugins
 * Version: 1.0.0
 * Requires at least: 4.0
 * Requires PHP: 7.4
 * Author: BootComposer Team
 * Author URI: https://bootcomposer.org
 * Domain Path: /languages
 */

// Define paths for the included plugins
define('MASTER_PLUGIN_DIR', plugin_dir_path(__FILE__));

// Include each sub-plugin
include_once MASTER_PLUGIN_DIR . 'enable-disable-features/enable-disable-features.php';
include_once MASTER_PLUGIN_DIR . 'searchable-select/searchable-select-in-wp-admin.php';
include_once MASTER_PLUGIN_DIR . 'wp-pace/wp-pace.php';
include_once MASTER_PLUGIN_DIR . 'admin-pro/admin-pro.php';