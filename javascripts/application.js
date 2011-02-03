Popup = (function() {
  function wire_popup(link, title_fn) {
    var popup_body = link.parent().find('.popup');
    jQuery(link).click(function() {
      popup_body.dialog({width: "800px", title: title_fn(link), draggable: true});
      return false;
    });
  }


  function general_popup(link_selector, title_fn) {
    jQuery(link_selector).each(function() {
      wire_popup(jQuery(this), title_fn);
    });
  }

  return {
    hookup_envvar_details_popup: function() {
      general_popup('a.variable_desc_link', function(link) {
        return "Environment variable '" + link.text() + "'";
      });
    },
    hookup_titled_popup: function(link_selector, title) {
      general_popup(link_selector, function() {
        return title;
      });
    }
  };
})();

function hookup_collapsible_pane() {
  jQuery(document).ready(function() {
    jQuery(".collapsibleContainer").collapsiblePanel();
  });
}