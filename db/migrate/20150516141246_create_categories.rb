class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, unique: true
      #t.references :category, index: true, foreign_key: true
      t.references :parent, index: true, references: :categories

      t.timestamps null: false
    end

    create_join_table :facts, :categories
  end
end
