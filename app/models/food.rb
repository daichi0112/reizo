class Food < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :unit
  belongs_to :category

  with_options presence: true do
    validates :name
    validates :unit
    validates :bb_date
    validates :category

    validates :number, numericality: { message: 'は半角数字で入力してください' },
                       inclusion: { in: 0..10_000, message: 'は0〜10,000の範囲内で入力してください' }
  end

  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :unit_id
    validates :category_id
  end
end
