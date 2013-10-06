class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy, :show]
  before_filter :correct_user, only: [:edit, :update, :show]
  before_filter :admin_user, only: [:destroy, :new, :create, :index]

  def index
    @users = User.order(:name)
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url }
          flash[:success] = "User #{@user.name} was successfully created."
        format.json { render action: 'show',
          status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors,
          status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url }
          flash[:success] = "User #{@user.name} was successfully updated."
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors,
          status: :unprocessable_entity }
      end
    end
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      #sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      flash[:success] = "User #{@user.name} was successfully destroyed"
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def correct_user
        redirect_to(root_url) unless current_user?(@user) || current_user.admin?
    end

    def admin_user
      redirect_to(root_url) unless current_user && current_user.admin?
    end
end
