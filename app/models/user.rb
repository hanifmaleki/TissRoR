class User < ApplicationRecord
  validates :username,  presence: true, length: { maximum: 25 }
end
