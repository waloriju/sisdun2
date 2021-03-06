class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include CurrentCart
  before_action :set_cart

  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end
end
