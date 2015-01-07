class CreateTableFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :amount
      t.string :expiration_date
      t.references :user
      t.timestamps
    end
  end
end
