class ExerciseSet < ActiveRecord::Base
  belongs_to :exercise
  attr_accessible :number_of_reps, :number_of_sets, :weight

  validates :number_of_reps, :presence => true,
            :numericality => { :greater_than_or_equal_to => 0 }

  validates :number_of_sets, :presence => true,
            :numericality => { :greater_than_or_equal_to => 0 }
            
  validates :weight, :presence => true,
            :numericality => { :greater_than_or_equal_to => 0 }
end
