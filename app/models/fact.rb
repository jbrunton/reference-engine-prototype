class Fact < ActiveRecord::Base
  belongs_to :reference
  belongs_to :wiki
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :references

  after_save :categorize
  after_save :reference

  def categorize
    categories.delete(*categories)
    categories_string.split(',').map(&:strip).each do |category_name|
      categories << Category.where(name: category_name, wiki: wiki).first_or_create
    end
    self
  end

  def reference
    references.delete(*references)
    references_string.split(',').map(&:strip).each do |reference_key|
      references << Reference.find_by(key: reference_key, wiki: wiki)
    end
    self
  end
end
