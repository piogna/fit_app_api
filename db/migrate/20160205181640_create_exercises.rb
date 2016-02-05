class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :type
      t.string :body_part

      t.timestamps null: false
    end
  end
end
