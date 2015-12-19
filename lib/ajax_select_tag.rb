require "ajax_select_tag/version"

module AjaxSelectTag
  def e_select_tag(id, collections, text, value, children_url = nil, html_options = {})
    options = children_url.nil? ? [] : collections.map { |c| [c.send(text), c.send(value), data: { children_path: url_for(c) }] }
    html_options[:class] ||= ''
    html_options[:class].concat(" enh_select_#{id}")
    select_tag id, options_for_select(options), html_options
  end

  def e_select_js(parent_id, children_id)
    select_parent   = "enh_select_#{parent_id}"
    select_children = "enh_select_#{children_id}"
    <<"JS"
<script>
$(function() {
  return (function() {
    var replaceChildrenOptions, replaceSelectOptions;
    replaceSelectOptions = function($select, results) {
      $select.html('');
      return $.each(results, function() {
        var option;
        option = $('<option>').val(this[0]).text(this[1]);
        return $select.append(option);
      });
    };
    replaceChildrenOptions = function() {
      var $selectChildren, childrenPath;
      childrenPath = $(this).find('option:selected').data().childrenPath;
      $selectChildren = $(this).closest('form').find('.#{select_children}');
      if (childrenPath != null) {
        return $.ajax({
          url: childrenPath,
          dataType: "json",
          success: function(results) {
            return replaceSelectOptions($('.#{select_children}'), results);
          },
          error: function(XMLHttpRequest, textStatus, errorThrown) {
            console.error("Error occurred in replaceChildrenOptions");
            console.log("XMLHttpRequest: " + XMLHttpRequest.status);
            console.log("textStatus: " + textStatus);
            return console.log("errorThrown: " + errorThrown);
          }
        });
      } else {
        return replaceSelectOptions($selectChildren, []);
      }
    };
    return $('.#{select_parent}').on({
      'change': replaceChildrenOptions
    });
  })();
});
</script>
JS
      .html_safe
  end
end
