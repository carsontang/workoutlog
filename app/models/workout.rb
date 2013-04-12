class Workout < ActiveRecord::Base
  attr_accessible :workout_date, :exercises_attributes
  belongs_to :user
  has_many :exercises
  accepts_nested_attributes_for :exercises
end
