class Category < ApplicationRecord
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '野菜' },
    { id: 3, name: '肉' },
    { id: 4, name: '魚介' },
    { id: 5, name: '米・パン・麺類' },
    { id: 6, name: '卵・チーズ・乳製品' },
    { id: 7, name: '飲料' },
    { id: 8, name: '調味料' },
    { id: 9, name: '粉類' },
    { id: 10, name: '乾物' },
    { id: 11, name: '豆腐・納豆・漬物' },
    { id: 12, name: '惣菜・レトルト・冷凍' },
    { id: 13, name: '果物' },
    { id: 14, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :foods

end
