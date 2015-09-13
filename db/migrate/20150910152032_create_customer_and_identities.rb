class CreateCustomerAndIdentities < ActiveRecord::Migration
  def change
    create_table :customers_identities, id:false do  |t|
      t.belongs_to :customer, index: true
      t.belongs_to :identity, index: true
    end
  end
end
