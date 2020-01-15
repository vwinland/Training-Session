class ChangeRoutinesExercisesToExercisesRoutines < ActiveRecord::Migration
  def change
    drop_table :routines_exercises
    create_join_table :exercises, :routines do |t|
      t.integer :exercise_id
      t.integer :routine_id
    end
  end
end
