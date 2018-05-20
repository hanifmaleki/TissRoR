class User < ApplicationRecord
  validates :username,  presence: true, length: { minimum: 3, maximum: 30 }
  has_many :favourite_courses
  #has_many :courses, :through => :favourite_courses
end
