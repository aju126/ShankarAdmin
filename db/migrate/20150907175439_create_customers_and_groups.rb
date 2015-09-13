class CreateCustomersAndGroups < ActiveRecord::Migration
  def change
    create_table :customers_groups, id: false do |t|
      t.belongs_to :customer, index: true
      t.belongs_to :group, index: true
    end
  end
end
