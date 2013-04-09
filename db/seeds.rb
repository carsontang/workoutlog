# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@workout_april_2 = Workout.create(:workout_date => DateTime.new(2013, 4, 2, 20, 0, 0, '+7'))
@workout_april_3 = Workout.create(:workout_date => DateTime.new(2013, 4, 3, 20, 0, 0, '+7'))

@squat = Lift.create(:lift_name => "Squat")

@april_2_squat = Exercise.create(:workout => @workout_april_2, :lift => @squat)
