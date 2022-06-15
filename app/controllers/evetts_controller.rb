class EvettsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :edit, :show]
  before_action :evett_find, only: [:show, :edit, :update, :destroy]

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
end
