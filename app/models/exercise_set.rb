class ExerciseSet < ActiveRecord::Base
  belongs_to :exercise
  attr_accessible :number_of_reps, :number_of_sets, :weight
end
