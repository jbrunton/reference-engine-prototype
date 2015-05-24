class AddWikiToReferences < ActiveRecord::Migration
  def change
    add_reference :references, :wiki, index: true, foreign_key: true
  end
end
