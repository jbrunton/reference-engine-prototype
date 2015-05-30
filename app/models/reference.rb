class Reference < ActiveRecord::Base
  include WikiPage

  has_and_belongs_to_many :facts
end
