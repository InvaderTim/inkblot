module ApplicationHelper

  def nav_link(link_text, link_path, options = {})
    class_name = "btn btn-primary"
    class_name += current_page?(link_path) ? ' active' : ''

    options = {class: class_name}.merge(options)

    content_tag(:li) do
      link_to link_text, link_path, options
    end
  end

end
