class CreatePricings < ActiveRecord::Migration
  def change
    create_table :pricings do |t|
      t.integer :cost_price, null: false
      t.string  :reason
      t.timestamps null: false
    end
  end
end
