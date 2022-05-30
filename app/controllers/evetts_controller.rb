class EvettsController < ApplicationController
  # before_action :authenticate_user!#, only: [:new, :edit]
  # before_action :unless_user_id, only: [:edit, :destroy]

  def index
  end

  private

  def unless_user_id
    redirect_to root_path unless current_user.id == @evett.user_id
  end
end
