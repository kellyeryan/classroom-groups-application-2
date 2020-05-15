class Classroom < ApplicationRecord
  belongs_to :user
  has_many :students

  validates :subject_name, presence: true
end
