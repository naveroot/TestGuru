# frozen_string_literal: true

module ApplicationHelper
  BOOTSTRAP_ALERT_CLASSES = { success: 'alert-success', error: 'alert-danger', alert: 'alert-warning', notice: 'alert-info' }.freeze
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'GitHub', "https://github.com/#{author}/#{repo}", target: :blank
  end

  def flash_messages
    tags = flash.map do |key, value|
      content_tag(:p, value.html_safe, class: "flash #{bootstrap_class_for_flash(key)}")
    end
    safe_join(tags)
  end

  def user_badges(user)
    html = user.get_user_badges_hash.map do |key, value|
      content_tag :div, class: 'p-2' do
        "#{image_tag value[:image], size: 40, alt: key, class: 'rounded-circle'} X #{value[:count]}".html_safe
      end
    end

    safe_join(html)
  end

  private

  def bootstrap_class_for_flash(flash_type)
    BOOTSTRAP_ALERT_CLASSES[flash_type.to_sym] || flash_type
  end
end
