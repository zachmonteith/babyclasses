# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  birthday   :date             not null
#  user_id    :integer          not null
#  chaperones :text
#  notes      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
