class FriendsController < ApplicationController
  def create
    @user = current_user
    following_size = @user.following.size
    if @user.rank_id == 1
      if following_size < 10
        current_user.follow(params[:user_id])
        redirect_to request.referer, notice: "フォローしました"
      else
        redirect_to request.referer, notice: "ブロンズランクのフォロー上限は10人です"
      end
    elsif @user.rank_id == 2
      if following_size < 30
        current_user.follow(params[:user_id])
        redirect_to request.referer, notice: "フォローしました"
      else
        redirect_to request.referer, notice: "シルバーランクのフォロー上限は30人です"
      end
    elsif @user.rank_id == 3
      if following_size < 100
        current_user.follow(params[:user_id])
        redirect_to request.referer, notice: "フォローしました"
      else
        redirect_to request.referer, notice: "ゴールドランクのフォロー上限は100人です"
      end
    end
    
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end
end
