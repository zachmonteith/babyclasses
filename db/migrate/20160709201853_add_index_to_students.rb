class AddIndexToStudents < ActiveRecord::Migration
  def change
  add_index :students, :user_id
  add_index :courses, :user_id

end
end
