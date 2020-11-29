class Food < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :unit
  belongs_to :category

  with_options presence: true do
    validates :name
    validates :bb_date

    validates :number, numericality: { message: 'は半角数字で入力してください' },
                       inclusion: { in: 1..10_000, message: 'は1〜10,000以内で入力してください' }

    with_options numericality: { other_than: 1, message: 'を選択してください' } do
      validates :unit_id
      validates :category_id
    end
  end

  # 前日以前の日付は保存できないよう設定
  validate :bb_date_check

  def bb_date_check
    errors.add(:bb_date, 'は今日の日付以降のものを選択してください') if bb_date.nil? || bb_date < Date.today
  end
end
