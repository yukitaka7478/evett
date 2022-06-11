FactoryBot.define do
  factory :payment do
    pay {3000}
    token {"tok_abcdefghijk00000000000000000"}
    association :user
    association :evett
  end
end
