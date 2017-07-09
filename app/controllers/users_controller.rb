class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    session[:user_id] = @user.id
    if @user.save
      session[:user_id] = @user.id
      redirect_to organization_path
    else
      render :new
    end

  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :age, :email, :picture, :password, :password_confirmation)
  end

end
