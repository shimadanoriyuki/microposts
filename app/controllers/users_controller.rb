class UsersController < ApplicationController
  
  def show
   @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.new
  end
  
  def update
    @user = User.new(user_paramsedit)
    if @user.save
      flash[:success] = "Success Update!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
  
  def user_paramsedit
    params.require(:user).permit(:name, :email, :tel, :location, :contents, :password,
                                 :password_confirmation)
  end
end
