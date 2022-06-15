10.times do |n|
  User.create!(
    # n + 1で数字が重複しないようにする
    email: "test#{n + 1}@test",
    nickname: "テストユーザー#{n + 1}",
    password: "testhoge#{n + 1}"
  )
end

Evett.create!(
  name: "ディズニー旅行",
  text: "一泊二日でランドとシーに行く。",
  price: 70000,
  limit_date: nil,
  share_area_id: 1,
  user_id: 1
)

Evett.create!(
  name: "スマホカバー",
  text: "supremeの限定品",
  price: 7000,
  limit_date: nil,
  share_area_id: 3,
  user_id: 1
)


