class CreateTableFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.string :expiration_date
      t.timestamps
    end
  end
end
