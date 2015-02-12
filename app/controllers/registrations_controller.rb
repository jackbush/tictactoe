class RegistrationsController < Devise::RegistrationsController
 
  private
 
  def sign_up_params
    params.require(:player).permit(:username, :email, :password, :password_confirmation)
  end
 
  def account_update_params
    params.require(:player).permit(:username, :email, :password, :password_confirmation, :current_password)
  end
  
end

  # :avatar
  # <div class="field">
  #   <%= f.label :avatar %><br />
  #   <%= f.file_field :avatar %>
  # </div>