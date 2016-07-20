# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  course_name :string           not null
#  course_date :date             not null
#  course_time :time             not null
#  max_size    :integer          not null
#  user_id     :integer          not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Course < ActiveRecord::Base
  belongs_to(
    :instructor,
    class_name: "User",
    foreign_key: :user_id
  )

  has_many :enrollments

  has_many :students,
    through: :enrollments,
    source: :student



end
