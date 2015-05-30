class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :key
      t.string :title
      t.string :author
      t.string :url
      t.string :summary
      t.string :version_description
      t.integer :version_number


      t.timestamps null: false
    end
  end
end
