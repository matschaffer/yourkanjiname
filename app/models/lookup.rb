class Lookup
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :name

  def persisted?
    false
  end
end
