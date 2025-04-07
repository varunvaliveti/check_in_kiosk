class Student < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :check_in_time, presence: true
end
