class Category < ActiveRecord::Base
  belongs_to :category
  belongs_to :wiki
  belongs_to :parent, class_name: "Category"
  has_and_belongs_to_many :facts

  after_commit :assign_parent

  def assign_parent
    parent_name = category_path[0..-2].join('/')
    unless parent_name.empty?
      self.parent = Category.where(name: parent_name).first_or_create
      save if changes['parent_id']
    end
  end

  def category_path
    name.split('/')
  end

  def ancestors
    [parent].concat(parent.try(:ancestors) || []).compact
  end

  def short_name
    category_path.last
  end

  def subcategories
    Category.where("name LIKE :category", category: "#{name}/%")
  end

  def related_categories
    Category.where(parent: parent).
            select{ |category| category != self }
  end
end
