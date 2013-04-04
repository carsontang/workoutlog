class CreateLifts < ActiveRecord::Migration
  def change
    create_table :lifts do |t|
      t.string :lift_name

      t.timestamps
    end
  end
end
