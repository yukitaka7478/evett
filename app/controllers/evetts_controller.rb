class EvettsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new]
  #  before_action :unless_user_id, only: [:edit, :destroy]

  def index
    @evetts_all = Evett.where(share_area_id: 1).order('created_at DESC')
    @evetts_friend = Evett.where(share_area_id: 2).order('created_at DESC')
    @evetts_only = Evett.where(share_area_id: 3).order('created_at DESC')
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
    @evett = Evett.find(params[:id])
  end

  private

  def evett_params
    params.require(:evett).permit(:name, :text, :price, :limit_date, :share_area_id).merge(user_id: current_user.id)
  end

  def unless_user_id
    redirect_to root_path unless current_user.id == @evett.user_id
  end
end
