class UsersController < ApplicationController
  before_action :set_id, only: [:show, :edit, :update, :followings, :followers]
  before_action :check_user, only: [:edit, :update]
  
  def show
    @microposts = @user.microposts.order(created_at: :desc).page(params[:page]).per(5)
    @reposts = @user.reposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ようこそマイクロポストへ！"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "更新されました"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def followings
    @followings = @user.following_users
  end
  
  def followers
    @followers = @user.follower_users
  end

  private
  
  def set_id
    @user = User.find(params[:id])
  end
  
  def check_user
    if @user != current_user
      redirect_to @user , notice: '自分以外のプロフィールを編集することはできません'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :tel, :location, :contents, :password,
                                 :password_confirmation,
                                 :avatar)
  end
end
