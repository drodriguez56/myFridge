class CreateTableFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.float :amount
      t.date :expiration_date
      t.references :user
      t.timestamps
    end
  end
end
