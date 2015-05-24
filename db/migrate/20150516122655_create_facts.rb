class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.text :summary
      t.text :content
      t.string :references_string
      t.string :categories_string
      t.string :version_description

      t.timestamps null: false
    end

    create_join_table :facts, :references
  end
end
