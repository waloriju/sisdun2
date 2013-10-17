class StoreController < ApplicationController
  before_action :signed_in_user
  include CurrentCart
  before_action :set_cart
  def index
    @products = Product.order(:title)
  end
end
