class Classroom < ApplicationRecord
  belongs_to :user
  has_many :students, dependent: :destroy

  validates :subject_name, presence: true
end
