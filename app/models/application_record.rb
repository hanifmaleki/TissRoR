class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  TYPES = ['PROJECT', 'THESIS', 'COURSE', 'PERSON'].freeze
end
