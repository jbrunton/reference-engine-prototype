module WikiPage
  extend ActiveSupport::Concern

  included do
    has_paper_trail

    validates :version_description, presence: true

    before_save :set_version
  end

  def set_version
    self.version_number = (self.version_number || 0) + 1
  end
end