class Fact < ActiveRecord::Base
  belongs_to :reference

  def reference_keys
    references.split(",").map(&:strip)
  end

  def reference_records
    Reference.where(key: reference_keys)
  end
end
