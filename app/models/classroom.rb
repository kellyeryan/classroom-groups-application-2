class Classroom < ApplicationRecord
  belongs_to :user

  validates :subject_name, presence: true
end
