class Reference < ActiveRecord::Base
  has_paper_trail

  validates :version_description, presence: true

  before_save :set_version

  has_and_belongs_to_many :facts

  def set_version
    self.version_number = (self.version_number || 0) + 1
  end
end
