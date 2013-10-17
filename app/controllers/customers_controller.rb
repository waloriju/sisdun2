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
    @customer.build_address
    @customer.build_contact
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer }
        flash[:success] = "Cliente #{@customer.full_name} criado com sucesso."
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
        format.html { redirect_to @customer }
        flash[:success] = "Cliente #{@customer.full_name} atualizado com sucesso."
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
      flash[:success] = "Cliente #{@customer.full_name} removido com sucesso."
      format.json { head :no_content }
    end
  end

  def cities_by_state
    state_id = params[:id].to_i
    cities = City.where(:state_id => state_id)
    cty = []
    cities.each do |city|
      cty << {:id => city.id, :n => city.name}
    end
    render :json => {:cty => cty.compact}.as_json
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :gender, :cpf, :birth_date, address_attributes:[:line1, :line2, :number, :postal_code, :city_id], contact_attributes:[:phone1, :phone2, :phone3, :email])
  end
end
