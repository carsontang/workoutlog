class Exercise < ActiveRecord::Base
  attr_accessible :lift_id, :exercise_sets_attributes
  belongs_to :lift
  belongs_to :workout
  has_many :exercise_sets
  accepts_nested_attributes_for :exercise_sets
end
