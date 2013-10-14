class SessionsController < ApplicationController

  def new
    unless !signed_in?
      redirect_to root_url, notice: "Você está logado!"
    end
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = "E-mail ou password incorreto"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end