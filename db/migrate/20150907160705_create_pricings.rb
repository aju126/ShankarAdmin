class CreatePricings < ActiveRecord::Migration
  def change
    create_table :pricings do |t|
      t.integer :cost_price, null: false
      t.belongs_to :package
      t.timestamps null: false
    end
  end
end
