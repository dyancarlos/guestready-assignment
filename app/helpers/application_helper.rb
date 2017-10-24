module ApplicationHelper
  def validation(object)
    return unless object
    if object.errors.any?
      html = content_tag(:div, content_tag(:h4, t("validations.error")))
      object.errors.full_messages.each { |msg| html << content_tag(:li, msg) }
      content_tag(:div, html, class: "validation").html_safe
    end
  end

  def flash_message
    message = ""
    [:notice, :info, :warning, :error, :alert].each {|type|
      message <<
        content_tag(:div, flash[type], class: "flash-message #{type.to_s}") if flash[type]
    }

    message.html_safe
  end
end
