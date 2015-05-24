class AddWikiToCategories < ActiveRecord::Migration
  def change
    add_reference :categories, :wiki, index: true, foreign_key: true
  end
end
