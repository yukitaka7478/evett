FactoryBot.define do
  factory :friend do
    following_id { FactoryBot.create(:user).id }
    followed_id { FactoryBot.create(:user).id }
  end
end
