class Fact < ActiveRecord::Base
  has_paper_trail

  validates :version_description, presence: true

  belongs_to :reference
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :references

  before_save :set_version
  after_save :categorize
  after_save :reference

  def categorize
    categories.delete(*categories)
    categories_string.split(',').map(&:strip).each do |category_name|
      categories << Category.where(name: category_name).first_or_create
    end
    self
  end

  def reference
    references.delete(*references)
    references_string.split(',').map(&:strip).each do |reference_key|
      references << Reference.find_by(key: reference_key)
    end
    self
  end

  def set_version
    self.version_number = (self.version_number || 0) + 1
  end
end
