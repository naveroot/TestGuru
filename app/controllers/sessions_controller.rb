class SessionsController < Devise::SessionsController
  def create
    super
    set_flash_message(:notice, :signed_in_with_name, first_name: current_user.first_name)
  end
end