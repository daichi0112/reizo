require 'rails_helper'

RSpec.describe Food, type: :model do
  describe '#create' do
    before do
      @food = FactoryBot.build(:food)
    end

    it '正しい情報が存在すれば保存できること' do
      expect(@food).to be_valid
    end

    it 'nameが空では保存できないこと' do
      @food.name = nil
      @food.valid?
      expect(@food.errors.full_messages).to include('食材名を入力してください')
    end

    it 'numberが空では保存できないこと' do
      @food.number = nil
      @food.valid?
      expect(@food.errors.full_messages).to include('数字を入力してください')
    end

    it 'numberが半角数字でない場合、保存できないこと' do
      @food.number = '１２３４'
      @food.valid?
      expect(@food.errors.full_messages).to include('数字は半角数字で入力してください')
    end

    it 'numberが0の場合、保存できないこと' do
      @food.number = 0
      @food.valid?
      expect(@food.errors.full_messages).to include('数字は1〜10,000以内で入力してください')
    end

    it 'numberが10000より上の場合、保存できないこと' do
      @food.number = 10_001
      @food.valid?
      expect(@food.errors.full_messages).to include('数字は1〜10,000以内で入力してください')
    end

    it 'unit_idが空では保存できないこと' do
      @food.unit_id = nil
      @food.valid?
      expect(@food.errors.full_messages).to include('単位を入力してください')
    end

    it 'unit_idが1の場合、保存できないこと' do
      @food.unit_id = 1
      @food.valid?
      expect(@food.errors.full_messages).to include('単位を選択してください')
    end

    it 'bb_dateが空では保存できないこと' do
      @food.bb_date = nil
      @food.valid?
      expect(@food.errors.full_messages).to include('賞味期限を入力してください')
    end

    it 'category_idが空では保存できないこと' do
      @food.category_id = nil
      @food.valid?
      expect(@food.errors.full_messages).to include('カテゴリーを入力してください')
    end

    it 'category_idが1の場合、保存できないこと' do
      @food.category_id = 1
      @food.valid?
      expect(@food.errors.full_messages).to include('カテゴリーを選択してください')
    end

    it 'userが紐づいていない場合、保存できないこと' do
      @food.user = nil
      @food.valid?
      expect(@food.errors.full_messages).to include('Userを入力してください')
    end
  end
end
