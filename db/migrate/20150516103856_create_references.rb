class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      # wiki page
      t.string :title
      t.string :content

      # versioning
      t.string :version_description
      t.integer :version_number

      # metadata
      t.string :key
      t.string :author
      t.string :url


      t.timestamps null: false
    end
  end
end
