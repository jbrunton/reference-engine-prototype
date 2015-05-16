class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.string :summary
      t.string :references
      t.string :categories

      t.timestamps null: false
    end
  end
end
