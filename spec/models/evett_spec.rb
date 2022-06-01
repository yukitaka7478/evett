require 'rails_helper'

RSpec.describe Evett, type: :model do
  before do
    @evett = FactoryBot.build(:evett)
  end

  describe 'evett投稿機能' do
    context '投稿できる場合' do
      it '必要な情報を適切に入力して「投稿する」ボタンを押すと、evett情報がデータベースに保存される' do
        expect(@evett).to be_valid
      end
    end
    context '投稿できない場合' do
      it 'nameが空では出品できない' do
        @evett.name = nil
        @evett.valid?
        expect(@evett.errors.full_messages).to include('evett名を入力してください')
      end
      it 'textが空では出品できない' do
        @evett.text = nil
        @evett.valid?
        expect(@evett.errors.full_messages).to include('説明を入力してください')
      end
      it 'priceが空では出品できない' do
        @evett.price = nil
        @evett.valid?
        expect(@evett.errors.full_messages).to include('価格を入力してください')
      end
      it 'priceが300円を下回ると出品できない' do
        @evett.price = '299'
        @evett.valid?
        expect(@evett.errors.full_messages).to include('価格は299より大きい値にしてください')
      end
      it 'priceが10000000円を超えると出品できない' do
        @evett.price = '10000000'
        @evett.valid?
        expect(@evett.errors.full_messages).to include('価格は10000000より小さい値にしてください')
      end
      it 'priceが半角数値でないと出品できない' do
        @evett.price = '３００'
        @evett.valid?
        expect(@evett.errors.full_messages).to include('価格は数値で入力してください')
      end
      it 'userが存在しなければ出品できない' do
        @evett.user = nil
        @evett.valid?
        expect(@evett.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
