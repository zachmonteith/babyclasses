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

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
