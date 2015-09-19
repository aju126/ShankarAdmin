class CreatePricingNames < ActiveRecord::Migration
  def change
    create_table :pricing_names do |t|
      t.string :name
      t.string :currency
      t.belongs_to :pricing
      t.timestamps null: false
    end
  end
end
