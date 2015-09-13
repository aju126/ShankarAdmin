class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string  :name, null: false
      t.text    :notes
      t.timestamps null: false
    end
  end
end
