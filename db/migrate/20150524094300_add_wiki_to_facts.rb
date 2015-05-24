class AddWikiToFacts < ActiveRecord::Migration
  def change
    add_reference :facts, :wiki, index: true, foreign_key: true
  end
end
