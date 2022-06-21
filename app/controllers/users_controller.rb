class UsersController < ApplicationController
  before_action :user_find, only: [:show, :following, :followed]

  def show
    @evetts = Evett.where(user_id: @user.id).order('created_at DESC')
    @payments = Payment.where(user_id: @user.id).select(:evett_id).distinct

    if @user.id == current_user.id
      Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 環境変数を読み込む
      card = Card.find_by(user_id: current_user.id) # ユーザーのid情報を元に、カード情報を取得
      redirect_to new_user_card_path(current_user) and return unless card.present?

      customer = Payjp::Customer.retrieve(card.customer_token) # 先程のカード情報を元に、顧客情報を取得
      @card = customer.cards.first
      
      @following_users = @user.following_user.distinct.order('created_at DESC')
      @followed_users = @user.followed_user.distinct.order('created_at DESC')
    end
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      redirect_to action: 'show'
    end
  end

  def following
    @users = @user.following
    render 'show_user'
  end

  def followed
    @users = @user.followed
    render 'show_user'
  end

  def search
    return nil if params[:keyword] == ''

    user = User.where('nickname LIKE ?', "%#{params[:keyword]}%")
    render json: { keyword: user }
  end

  private

  def user_params
    params.require(:user).permit(:nickname)
  end

  def user_find
    @user = User.find(params[:id])
  end
end
