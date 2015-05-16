class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.string :summary
      t.references :reference, index: true, foreign_key: true
      t.string :categories

      t.timestamps null: false
    end
  end
end
