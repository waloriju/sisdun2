class StoreController < ApplicationController
  before_action :signed_in_user
  def index
    @products = Product.order(:title)
  end
end
