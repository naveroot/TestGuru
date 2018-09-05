# frozen_string_literal: true

class FeedbacksMailer < ApplicationMailer
  before_action :find_admins

  def new_feedback(feedback)
    @feedback = feedback
    @recipients = @admins.map(&:email).join(',')
    mail  to: @recipients,
          subject: 'feedback_test'
  end

  private

  def find_admins
    @admins = Admin.all
  end
end
