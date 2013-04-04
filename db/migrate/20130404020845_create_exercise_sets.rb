class CreateExerciseSets < ActiveRecord::Migration
  def change
    create_table :exercise_sets do |t|
      t.references :exercise
      t.integer :number_of_reps
      t.integer :number_of_sets
      t.integer :weight

      t.timestamps
    end
    add_index :exercise_sets, :exercise_id
  end
end
