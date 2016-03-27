class UsersController < ApplicationController
  before_action :set_id, only: [:show, :edit, :update]
  
  def show
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
    if @user != current_user
      redirect_to @user , notice: '自分以外のプロフィールを編集することはできません'
    end
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "Success Update!"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def set_id
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :tel, :location, :contents, :password,
                                 :password_confirmation)
  end
end
