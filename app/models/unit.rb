class Unit < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '個' },
    { id: 3, name: 'パック' },
    { id: 4, name: '袋' },
    { id: 5, name: 'g' },
    { id: 6, name: '尾' },
    { id: 7, name: '切れ' },
    { id: 8, name: '玉' },
    { id: 9, name: '枚' }
  ]

  include ActiveHash::Associations
  has_many :foods

end
