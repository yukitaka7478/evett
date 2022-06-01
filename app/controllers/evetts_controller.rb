class EvettsController < ApplicationController
  before_action :authenticate_user!, only: :new
  #  before_action :unless_user_id, only: [:edit, :destroy]

  def index
    @evetts = Evett.all.order('created_at DESC')
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

  private

  def evett_params
    params.require(:evett).permit(:name, :text, :price, :limit_date, :share_area_id).merge(user_id: current_user.id)
  end

  def unless_user_id
    redirect_to root_path unless current_user.id == @evett.user_id
  end
end
