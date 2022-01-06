class Timer < ApplicationRecord
  belongs_to :user

  validates_presence_of :name
  validates_presence_of :duration
end