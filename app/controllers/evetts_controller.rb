class EvettsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :edit, :show]
  before_action :evett_find, only: [:show, :edit, :update, :destroy]
  before_action :unless_user_id, only: [:edit, :destroy]

  def index
    @evetts_all = Evett.where(share_area_id: 1).order('created_at DESC')
    @evetts_friend = Evett.where(share_area_id: 2).order('created_at DESC')
    @evetts_only = Evett.where(share_area_id: 3).order('created_at DESC')

    @followed_users = current_user.followed_user
  end

  def new
    @evett = Evett.new
  end

  def create
    @evett = Evett.new(evett_params)
    evett_size = Evett.where(user_id: @evett.user_id).size
    if @evett.valid?
      if @evett.user.rank_id == 1 
        if evett_size <= 5
          @evett.save
          redirect_to root_path, notice: "投稿を保存しました"
        else
          redirect_to root_path, notice: "ブロンズランクの投稿数は５までです"
        end
      elsif @evett.user.rank_id == 2
        if evett_size <= 10
          @evett.save
          redirect_to root_path, notice: "投稿を保存しました"
        else
          redirect_to root_path, notice: "シルバーランクの投稿数は10までです"
        end
      elsif @evett.user.rank_id == 3
        if evett_size <= 50
          @evett.save
          redirect_to root_path, notice: "投稿を保存しました"
        else
          redirect_to root_path, notice: "ゴールドランクの投稿数は50までです"
        end
      end
    else
      render :new
    end
  end

  def show
    @payment = Payment.where(evett_id: @evett.id).sum(:pay)
    
    if @evett.share_area_id == 3
      redirect_to root_path unless @evett.user.id == current_user.id
    elsif @evett.share_area_id == 2 
      if current_user.following_user.find_by(id: @evett.user.id) != nil
        redirect_to root_path unless @evett.user.id == current_user.id
      end
    end
  end

  def edit
    session[:previous_url] = request.referer
  end

  def update
    if @evett.update(evett_params)
      redirect_to session[:previous_url]
    else
      render :edit
    end
  end

  def destroy
    @evett.destroy
    redirect_to request.referrer || root_path
  end

  private

  def evett_params
    params.require(:evett).permit(:name, :text, :price, :limit_date, :share_area_id).merge(user_id: current_user.id)
  end

  def evett_find
    @evett = Evett.find(params[:id])
  end

  def unless_user_id
    redirect_to root_path unless current_user.id == @evett.user_id
  end
end
