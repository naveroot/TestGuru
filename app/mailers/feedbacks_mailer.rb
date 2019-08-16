# frozen_string_literal: true

class FeedbacksMailer < ApplicationMailer
  default to: ->{ Admin.pluck(:email)}

  def new_feedback(feedback)
    @feedback = feedback
    mail subject: I18n.t('mail.feedback.subject', first_name: @feedback.user.first_name, last_name: @feedback.user.last_name)
  end
end
