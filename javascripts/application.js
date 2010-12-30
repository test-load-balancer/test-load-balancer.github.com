function hookup_details_popup() {
    jQuery('a.variable_desc_link').each(function() {
        var title = "Environment variable '" + jQuery(this).text() + "'";
        var popup_body = jQuery(this).parent().find('.popup');
        jQuery(this).click(function() {
            popup_body.dialog({width: "800px", title: title, draggable: true});
        });
    });
}

