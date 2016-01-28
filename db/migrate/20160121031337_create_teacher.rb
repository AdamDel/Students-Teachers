class CreateTeacher < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address
      t.string :phone
      t.date :last_student_added_at
      t.date :hire_date
      t.date :retirement_date
      t.timestamps null: false
    end
  end
end
