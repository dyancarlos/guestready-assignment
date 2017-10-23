module ApplicationHelper
  def validation(object)
    return unless object
    if object.errors.any?
      html = content_tag(:div, content_tag(:h1, t("validations.error")))
      object.errors.full_messages.each { |msg| html << content_tag(:li, msg) }
      content_tag(:div, html, class: "validation").html_safe
    end
  end
end
