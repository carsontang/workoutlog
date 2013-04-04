class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.datetime :workout_date

      t.timestamps
    end
  end
end
