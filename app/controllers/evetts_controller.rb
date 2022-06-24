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
    if @evett.save
      redirect_to root_path
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
