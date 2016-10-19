class ProfileController < ApplicationController
  # layout 'inspinia'

  before_action :authenticate_user!
  before_action :set_user, only: [:index, :update_data, :treatments, :update_treatments,:change_password]
  before_action :set_requests, only: [:index, :update_data, :treatments, :update_treatments, :change_password]

  def index
    @user = current_user
    @minimum_password_length = User.password_length.min
  end

  def treatments
    @user = current_user
    @minimum_password_length = User.password_length.min
    @treatment_types =TreatmentType.includes(:treatments).where.not(name: 'for_men')

  end


  def update_data
    @user.assign_attributes(user_params)
    # @user.assign_attributes(
    #     phone: @user.agency.phone,
    #     address: @user.agency.address,
    #     city: @user.agency.city,
    #     zip: @user.agency.zip,
    # ) if @user.agency.present?

    if @user.save
      redirect_to profile_path, notice: 'Your profile updated successfully'
    else
      render :index
    end
  end

  def update_treatments
    @user.assign_attributes(user_params)
    if @user.save
      redirect_to profile_path, notice: 'Your treatments updated successfully'
    else
      render :index
    end
  end



  def change_password
    if @user.update(user_password)
      sign_in @user, bypass: true
      redirect_to profile_path, notice: 'Your password updated successfully'
    else
      render :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:password_confirmation,:email,:password,:is_freelancer, :terms, :agency_id, :first_name, :last_name, :photo, :photo_cache,
                                 {agency_attributes:[:id,:phone, :name, :business_type_id, :city,:region,:address,:district,:latitude, :longitude,:zip, :street, :logo, :logo_cache,:treatments]})
  end


  def user_password
    params.require(:user).permit(:password, :password_confirmation)
  end

  def set_user
    @user = current_user
  end

  def set_requests
    # individual_services_request_details = {owner: @user, paid_service: PaidService.find_by_service(PaidService.services[:individual_services])}
    # # noinspection RubyArgCount
    # @request = Request.where(individual_services_request_details).first || Request.new(individual_services_request_details)
    #
    # agency_logo_request_details = {owner: @user, paid_service: PaidService.find_by_service(PaidService.services[:agency_logo])}
    # # noinspection RubyArgCount
    # @agency_logo_request = Request.where(agency_logo_request_details).first || Request.new(agency_logo_request_details)
  end
end
