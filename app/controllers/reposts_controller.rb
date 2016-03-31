class RepostsController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    @repost = current_user.microposts.build(repost_params)
    if @repost.save
      flash[:success] = "投稿に対してリポストしました"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end
  
  def destroy
    @repost = current_user.microposts.find_by(id: params[:id])
    return redirect_to root_url if @repost.nil?
    @repost.destroy
    flash[:success] = "リポストを削除しました"
    redirect_to request.referrer || root_url
  end
  
  private
  def repost_params
    params.require(:repost).permit(:content, :image)
  end
end
