VersionSelector = function() {
  var current_url = window.location.href;

  function wire_selector(self, select_box) {
    select_box.change(function() {
      var new_value = jQuery(this).val();
      switch_to(self, new_value);
    });
  }

  function populate_selector(self, select_box) {
    var html_select = select_box.get(0);
    for(var i = 0; i < self.versions.length; i++) {
      var version = self.versions[i];
      var option = version.get_option();
      if (version.matches_url(current_url)) {
        option.selected = true;
        self.current_version = version;
      }
      html_select.options[i] = option;
    }
  }

  function switch_to(self, new_value) {
    for (var i = 0; i < self.versions.length; i++) {
      var version = self.versions[i];
      if (version.matches(new_value)) {
        self.current_version.switch_to(version);
      }
    }
  }

  function init(select_box, versions) {
    this.versions = versions;
    this.current_version = null;
    populate_selector(this, select_box);
    wire_selector(this, select_box);
  }

  init.Version = function() {
    function init(dir_name, version_text) {
      this.dir_name = dir_name;
      this.version_text = version_text;
    }

    init.prototype.matches = function(dir_name) {
      return dir_name === this.dir_name;
    };

    init.prototype.matches_url = function(url) {
      return url.match(this.dir_name);
    };

    init.prototype.switch_to = function(new_version) {
      var url = current_url;
      window.location.href = url.replace(this.dir_name, new_version.dir_name);
    };

    init.prototype.get_option = function() {
      return new Option(this.version_text, this.dir_name);
    };

    return init;
  }();

  return init;
}();

jQuery(document).ready(function() {
  if (version_selector_id) {
    new VersionSelector(jQuery('#' + version_selector_id), [
      new VersionSelector.Version('doc-0_3_1', 'Version - 0.3.1 (latest released version)'),
      new VersionSelector.Version('doc-0_3_0', 'Version - 0.3.0'),
      new VersionSelector.Version('doc-0_1_0', 'Version - 0.1.1'),
      new VersionSelector.Version('doc-latest', 'Unreleased Bleeding edge (under development)')]);
  }
});
