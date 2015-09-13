class CreateCustomersAndProducts < ActiveRecord::Migration
  def change
    create_table :customers_products, id: false do |t|
      t.belongs_to :customer, index: true
      t.belongs_to :product, index: true
    end
  end
end
