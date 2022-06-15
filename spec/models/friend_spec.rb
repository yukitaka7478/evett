require 'rails_helper'

RSpec.describe Friend, type: :model do
  before do
    @friend = FactoryBot.build(:friend)
  end

  context '内容に問題ない場合' do
    it 'followed_idとfollowing_idが入力されて正しく保存できる場合' do
      expect(@friend).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'followed_idが空では保存できないこと' do
      @friend.followed_id = nil
      @friend.valid?
      expect(@friend.errors.full_messages).to include('Followedを入力してください')
    end
    it 'following_idが空では保存できないこと' do
      @friend.following_id = nil
      @friend.valid?
      expect(@friend.errors.full_messages).to include('Followingを入力してください')
    end
    it 'following_idとfollowed_idが同じ値では保存できないこと' do
      @friend.followed_id = 1
      @friend.following_id = 1
      @friend.valid?
      expect(@friend.errors.full_messages).to include('Followingを入力してください', 'Followedを入力してください')
    end
  end
end
