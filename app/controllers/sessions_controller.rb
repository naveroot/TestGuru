class SessionsController < Devise::SessionsController
  def create
    super
    set_flash_message(:notice, :welcome_message, first_name: current_user.first_name)
  end
end