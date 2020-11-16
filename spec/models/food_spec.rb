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
      expect(@food.errors.full_messages).to include("Name can't be blank")
    end

    it 'numberが空では保存できないこと' do
      @food.number = nil
      @food.valid?
      expect(@food.errors.full_messages).to include("Number can't be blank")
    end

    it 'numberが10000より上の場合、保存できないこと' do
      @food.number = 10_001
      @food.valid?
      expect(@food.errors.full_messages).to include('Number Out of setting range')
    end

    it 'unit_idが空では保存できないこと' do
      @food.unit_id = nil
      @food.valid?
      expect(@food.errors.full_messages).to include("Unit can't be blank")
    end

    it 'unit_idが1の場合、保存できないこと' do
      @food.unit_id = 1
      @food.valid?
      expect(@food.errors.full_messages).to include('Unit Select')
    end

    it 'bb_dateが空では保存できないこと' do
      @food.bb_date = nil
      @food.valid?
      expect(@food.errors.full_messages).to include("Bb date can't be blank")
    end

    it 'category_idが空では保存できないこと' do
      @food.category_id = nil
      @food.valid?
      expect(@food.errors.full_messages).to include("Category can't be blank")
    end

    it 'category_idが1の場合、保存できないこと' do
      @food.category_id = 1
      @food.valid?
      expect(@food.errors.full_messages).to include('Category Select')
    end

    it 'userが紐づいていない場合、保存できないこと' do
      @food.user = nil
      @food.valid?
      expect(@food.errors.full_messages).to include('User must exist')
    end
  end
end
