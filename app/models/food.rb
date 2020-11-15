class Food < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :unit
  belongs_to :category

  with_options presence: true do
    validates :name
    validates :num
    validates :unit
    validates :bb_date
    validates :category
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :unit_id
    validates :category_id
  end
end
