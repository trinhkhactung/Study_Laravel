/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
    config.filebrowserBrowseUrl = 'ckf/ckfinder.html';
	config.filebrowserImageBrowseUrl = 'ckf/ckfinder.html?type=Images';
	config.filebrowserFlashBrowseUrl = 'ckf/ckfinder.html?type=Flash';
	config.filebrowserUploadUrl = 'ckf/core/connector/php/connector.php?command=QuickUpload&type=Files';
	config.filebrowserImageUploadUrl = 'ckf/core/connector/php/connector.php?command=QuickUpload&type=Images';
	config.filebrowserFlashUploadUrl = 'ckf/core/connector/php/connector.php?command=QuickUpload&type=Flash';
	config.extraPlugins = 'video';
};
