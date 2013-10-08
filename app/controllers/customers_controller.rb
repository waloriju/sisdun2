class CustomersController < ApplicationController
  before_action :signed_in_user
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.all
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def search
    index
    render :index
  end

  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer }
          flash[:success] = "Customer #{@customer.full_name} was successfully created."
        format.json { render action: 'show', status: :created,
          location: @customer }
      else
        format.html { render action: 'new' }
        format.json { render json: @customer.errors,
          status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customers_url }
          flash[:success] = "Customer #{@customer.full_name} was successfully updated."
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @customer.errors,
          status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url }
      flash[:success] = "Customer #{@customer.full_name} was successfully destroyed"
      format.json { head :no_content }
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :gender, :cpf, :birth_date)
  end
end