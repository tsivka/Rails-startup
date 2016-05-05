class HomeController < ApplicationController
  # layout 'inspinia', only: [:thank_you, :approval_pending]

  before_action :allow_only_for_users_not_approved_by_superadmin, only: :approval_pending

  def index
    # @banners = { home_1: Banner.home_1.first, home_2: Banner.home_2.first }
  end

  def welcome
    redirect_to dashboard_url if current_user.present? && current_user.approved? && !super_admin_signed_in?
  end

  def all_uk_cities
    cities = []
    uk_cities.select { |key, city| cities.push(id: key, name: city.name) if key.start_with? params[:q].downcase }
    render json: cities.first(30).sort_by { |hash| hash[:id] }
  end

  private

  def allow_only_for_users_not_approved_by_superadmin
    redirect_to dashboard_url unless user_signed_in? && !current_user.approved?
  end
end