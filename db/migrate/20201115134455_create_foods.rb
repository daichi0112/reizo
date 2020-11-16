class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string     :name,        null: false
      t.integer    :number,      null: false
      t.integer    :unit_id,     null: false
      t.date       :bb_date,     null: false
      t.integer    :category_id, null: false
      t.references :user,        foreign_key: true
      t.timestamps
    end
  end
end
