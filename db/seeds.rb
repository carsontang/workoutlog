# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@squat = Lift.create(:lift_name => "Squat")
@press = Lift.create(:lift_name => "Press")
@deadlift = Lift.create(:lift_name => "Deadlift")

@carson = User.create(:email => "carson@test.com", :password => "password", :password_confirmation => "password")

@workout_april_2 = @carson.workouts.create(:workout_date => DateTime.new(2013, 4, 2, 20, 0, 0, '+7'))
@workout_april_3 = @carson.workouts.create(:workout_date => DateTime.new(2013, 4, 3, 20, 0, 0, '+7'))

@april_2_squat = @workout_april_2.exercises.create(:lift_id => @squat.id)
@april_2_squat_warmup_set = @april_2_squat.exercise_sets.create(:number_of_reps => 10, :number_of_sets => 1, :weight => 45)
@april_2_squat_warmup_set2 = @april_2_squat.exercise_sets.create(:number_of_reps => 5, :number_of_sets => 1, :weight => 65)
@april_2_squat_warmup_set3 = @april_2_squat.exercise_sets.create(:number_of_reps => 4, :number_of_sets => 1, :weight => 95)
@april_2_squat_warmup_set4 = @april_2_squat.exercise_sets.create(:number_of_reps => 3, :number_of_sets => 1, :weight => 115)
@april_2_squat_warmup_set5 = @april_2_squat.exercise_sets.create(:number_of_reps => 2, :number_of_sets => 1, :weight => 135)
@april_2_squat_warmup_set6 = @april_2_squat.exercise_sets.create(:number_of_reps => 1, :number_of_sets => 1, :weight => 145)
@april_2_squat_warmup_set7 = @april_2_squat.exercise_sets.create(:number_of_reps => 5, :number_of_sets => 3, :weight => 155)
@april_2_squat_work_set = @april_2_squat.exercise_sets.create(:number_of_reps => 5, :number_of_sets => 3, :weight => 170)

@april_2_press = @workout_april_2.exercises.create(:lift_id => @press.id)
@april_2_press_warmup_set = @april_2_press.exercise_sets.create(:number_of_reps => 5, :number_of_sets => 3, :weight => 150)
@april_2_press_work_set = @april_2_press.exercise_sets.create(:number_of_reps => 5, :number_of_sets => 3, :weight => 170)