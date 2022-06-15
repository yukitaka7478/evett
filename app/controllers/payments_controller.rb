class PaymentsController < ApplicationController
  before_action :evett_find

  def index
    @payment = Payment.new
  end

  def create
    if current_user.card.present?
      customer_token = current_user.card.customer_token
      @payment = Payment.new(
        user_id: current_user.id,
        evett_id: params[:evett_id],
        token: customer_token,
        pay: payment_params[:pay]
      )
    else
      @payment = Payment.new(payment_params)
    end
    if @payment.valid?
      if current_user.card.present?
        no_card_pay
      else
        pay_evett
      end
      @payment.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def evett_find
    @evett = Evett.find(params[:evett_id])
  end

  def payment_params
    params.require(:payment).permit(:pay).merge(evett_id: params[:evett_id], user_id: current_user.id, token: params[:token])
  end

  def pay_evett
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: payment_params[:pay],  # 商品の値段
      card: payment_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def no_card_pay
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer_token = current_user.card.customer_token
    Payjp::Charge.create(
      amount: payment_params[:pay],
      customer: customer_token,
      currency: 'jpy'
    )
  end
end
