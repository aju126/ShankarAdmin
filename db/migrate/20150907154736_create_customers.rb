class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.binary :photo
      t.string :reference
      t.string :mobile, null: false
      t.string :email, null: false
      t.text :comment
      t.timestamps null: false
    end
  end
end
