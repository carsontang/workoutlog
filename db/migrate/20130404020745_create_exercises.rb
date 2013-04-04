class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.references :lift
      t.references :workout

      t.timestamps
    end
    add_index :exercises, :lift_id
    add_index :exercises, :workout_id
  end
end
