class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]
  before_filter :configure_permitted_parameters
  def create
    super

  end


  # GET /resource/sign_up
  def new
    super
  end


  # GET /resource/edit
  def edit
    redirect_to profile_url
  end

  # PUT /resource
  def update
    super
  end


  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    user_steps_path
  end

# The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    user_steps_path
  end
  private

  def user_params
    params.require(:user).permit(:password_confirmation,:email,:password,:is_freelancer, :terms, :agency_id, :first_name, :last_name, :photo, :photo_cache,
                                 agency_attributes:[:phone, :name, :business_type_id, :city])
  end

end
