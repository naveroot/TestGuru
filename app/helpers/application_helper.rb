# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'GitHub', "https://github.com/#{author}/#{repo}", target: :blank
  end

  def flash_messages
    content_tag :p, flash[:alert], class: 'flash alert' if flash[:alert]
  end

  def welcome_message
    if user_signed_in?
      content_tag :div, class: 'nav user' do
        "Welcome, #{current_user.name} Guru"
      end
    end
  end
end
