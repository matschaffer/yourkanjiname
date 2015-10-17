class SourceName < ActiveRecord::Base
  has_many :transliterations, dependent: :destroy
end
