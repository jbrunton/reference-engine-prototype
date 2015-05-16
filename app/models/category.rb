class Category < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :facts

  after_commit :assign_parent

  def assign_parent
    parent_name, *rest = name.split('/')
    parent = Category.where(name: parent_name).first_or_create unless rest.empty?
  end
end
