class Wiki < ActiveRecord::Base
  has_many :facts
  has_many :references
  has_many :categories, through: :facts
end
