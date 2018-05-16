class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :courseNumber
      t.string :semesterCode
      t.string :courseType
      t.string :title
      t.string :objective
      t.string :trachingContent
      t.string :lectureNotes
      t.string :examinationModalities
      t.string :recommendation
      t.integer :precedingCourses
      t.string :weeklyHours
      t.integer :lecturers
      t.string :instituteCode
      t.string :instituteName
      t.string :registration
      t.string :language

      t.timestamps
    end
  end
end
