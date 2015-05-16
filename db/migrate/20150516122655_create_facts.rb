class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.string :summary
      t.string :references_string
      t.string :categories_string

      t.timestamps null: false
    end

    create_join_table :facts, :references
  end
end
