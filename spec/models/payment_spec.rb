require 'rails_helper'

RSpec.describe Payment, type: :model do
  before do
    @payment = FactoryBot.build(:payment)
  end
  context '内容に問題ない場合' do
    it "payとtokenがあれば保存ができること" do
      expect(@payment).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "payが空では保存ができないこと" do
      @payment.pay = nil
      @payment.valid?
      expect(@payment.errors.full_messages).to include("入金金額を入力してください", "入金金額は数値で入力してください")
    end

    it "tokenが空では登録できないこと" do
      @payment.token = nil
      @payment.valid?
      expect(@payment.errors.full_messages).to include("クレジットカード情報を入力してください")
    end
  end
end
