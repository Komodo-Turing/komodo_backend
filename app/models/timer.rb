class Timer < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :duration
end