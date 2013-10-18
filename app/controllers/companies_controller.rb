class CompaniesController < ApplicationController
  before_action :signed_in_user
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  # GET /companies
  # GET /companies.json
  def index
    @search = Company.search(params[:q])
    @companies = @search.result
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
    @company.build_address
    @company.build_contact
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company } 
        flash[:success] = "Empresa #{@company.company_name} criada com sucesso."
        format.json { render action: 'show', status: :created, location: @company }
      else
        format.html { render action: 'new' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company } 
        flash[:success] = "Empresa #{@company.company_name} criada com sucesso."
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url }
      flash[:success] = "Empresa #{@company.company_name} removida com sucesso."
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
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:company_name, :trading_name, :cnpj, address_attributes:[:line1, :line2, :number, :postal_code, :city_id], contact_attributes:[:phone1, :phone2, :phone3, :email])
    end
end
