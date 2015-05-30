class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      # wiki page
      t.string :title
      t.string :content

      # versioning
      t.string :version_description
      t.integer :version_number

      # metadata
      t.string :references_string
      t.string :categories_string

      t.timestamps null: false
    end

    create_join_table :facts, :references
  end
end
