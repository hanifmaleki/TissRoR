class SearchRequest < ApplicationRecord
  validates :expression, presence: true, length: { minimum: 3, maximum: 30 }
end
