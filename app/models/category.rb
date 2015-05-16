class Category < ActiveRecord::Base
  belongs_to :category
  #belongs_to :parent, class_name: "Category"
  has_and_belongs_to_many :facts

  # before_save :assign_parent
  #
  # def assign_parent
  #   puts "*** assign_parent (#{name})"
  #   parent_name, *rest = name.split('/')
  #   puts "*** parent_name (#{parent_name})"
  #   unless rest.empty?
  #     parent = Category.where(name: parent_name).first_or_create
  #     puts "*** parent: (#{parent.name})"
  #   end
  # end

  def category_path
    name.split('/')
  end

  #
  # def ancestors
  #   *ancestors, _ = category_parts
  #   ancestors
  # end

  def parent
    @parent ||= begin
      parent_name = category_path[0..-2].join('/')
      Category.find_by(name: parent_name)
    end
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
end
