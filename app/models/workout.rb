class Workout < ActiveRecord::Base
  attr_accessible :workout_date

  belongs_to :user
end
