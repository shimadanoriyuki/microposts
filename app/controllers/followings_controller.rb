class FollowingsController < ApplicationController
    def show
        @user = User.find(params[:id])
        @followings = @user.following_users
    end
end
