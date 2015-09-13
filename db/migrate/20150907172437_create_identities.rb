class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :name, null: false
      t.text   :comments
      t.belongs_to :customer, index: true
      t.timestamps null: false
    end
  end
end
