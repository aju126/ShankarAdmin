class CreateCustomersAndPricings < ActiveRecord::Migration
  def change
    create_table :customers_pricings, id: false do |t|
      t.belongs_to :customer, index: true
      t.belongs_to :pricing, index: true
    end
  end
end
