class Exercise < ActiveRecord::Base
  validates :name, :type, :body_part, presence: true
end
