class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end
  private

  def user_params
    firstname = params[:user][:first_name]
    lastname = params[:user][:last_name]
    email = params[:user][:email]

    firstname = firstname.strip! unless firstname.nil?
    lastname = lastname.strip! unless lastname.nil?
    email = email.downcase!.strip! unless email.nil?
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end