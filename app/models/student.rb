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

require 'action_view'

class Student < ActiveRecord::Base
  include ActionView::Helpers::DateHelper

  belongs_to :user
  has_many :enrollments

  has_many :courses,
  through: :enrollments,
  source: :course

  validates(
    :birthday,
    :name,
    :user_id,
    presence: true
  )

    validate :birthday_in_the_past, if: -> { birthday }

    def age
      time_ago_in_words(birthday)
    end

  private

  def birthday_in_the_past
    if birthday && birthday > Time.now
      errors[:birthday] << 'must be in the past'
    end
  end
end
