class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_name, null: false
      t.date :course_date, null: false
      t.time :course_time, null: false
      t.integer :max_size, null: false
      t.integer :user_id, null: false
      t.text :description
      t.timestamps null: false
    end
  end
end
