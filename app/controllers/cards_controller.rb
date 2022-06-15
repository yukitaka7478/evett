class CardsController < ApplicationController
  def new
    @card = Card.new
  end

  def create
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer = Payjp::Customer.create(card: params[:card_token])
    @card = Card.new(
      user_id: current_user.id,
      customer_token: customer.id,
      card_token: params[:card_token]
    )
    if @card.valid?
      @card.save
      redirect_to user_path(current_user.id)
    else
      render 'new'
    end
  end
end
