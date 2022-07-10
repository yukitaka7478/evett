class Rank < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ブロンズ' },
    { id: 2, name: 'シルバー' },
    { id: 3, name: 'ゴールド' }
  ]
end