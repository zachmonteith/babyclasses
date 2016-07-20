class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.date :birthday, null: false
      t.integer :user_id, null: false
      t.text :chaperones
      t.text :notes

      t.timestamps null: false
    end
  end
end
