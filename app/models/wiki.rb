class Wiki < ActiveRecord::Base
  has_many :facts
  has_many :references
end
