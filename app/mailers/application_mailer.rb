# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: %{'TestGuru' <mailer@testguru.com}
  layout 'mailer'
end
