class ApplicationController < ActionController::Base
  before_action :fetch_regions
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def fetch_regions
    @partial_regions = Region.having_reports
  end

  protect_from_forgery with: :exception
  include SessionsHelper

  def logged_in_user
    unless logged_in?
      redirect_to login_url
    end
  end

end
