class Student < ApplicationRecord
  belongs_to :classroom

  accepts_nested_attributes_for :classroom

  validates :name, presence: :true
  validates_associated :classroom
end
