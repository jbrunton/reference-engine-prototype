class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.string :name
      t.string :key

      t.timestamps null: false
    end
  end
end
