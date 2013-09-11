class CustomersController < ApplicationController
  before_action :signed_in_user

  def index
    @customer = Customer.paginate(page: params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:success] = "The Customer" + @customer.first_name + "registered with success"
      redirect_to :root_url
    else
      render 'new'
    end
  end

  private

    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :gender, :cpf, :birth_date)
    end

end