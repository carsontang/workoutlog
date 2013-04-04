class Exercise < ActiveRecord::Base
  belongs_to :lift
  belongs_to :workout
  # attr_accessible :title, :body
end
