class ShareArea < ActiveHash::Base
  self.data = [
    { id: 1, name: '全員' },
    { id: 2, name: '友達のみ' },
    { id: 3, name: '自分のみ' }
  ]
end
