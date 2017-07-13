class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    session[:user_id] = @user.id
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'New User created'
      redirect_to user_path(@user)
    else
      flash[:alert]= 'fix the errors'
      render :new
    end

  end

  def show
    @user = User.find(params[:id])
    @event 
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update user_params
      redirect_to user_path(@user)
    else
      render :edit
    end

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :age, :email, :picture, :password, :password_confirmation, :bio)
  end

end
