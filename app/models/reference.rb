class Reference < ActiveRecord::Base
  has_paper_trail

  validates :version_description, presence: true

  has_and_belongs_to_many :facts
end
