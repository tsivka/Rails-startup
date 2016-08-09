class UserStepsController < ApplicationController
  include Wicked::Wizard
  steps  :agency_info, :user_details_info

  def show
    @user = current_user
    render_wizard
  end


  def update

    @user = current_user

    @user.attributes = user_params

    render_wizard @user

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :is_freelancer, :agency_id, :first_name, :last_name, :photo, :agency,
                                 agency_attributes: [:id,:name, :business_type_id, :city])
  end
end