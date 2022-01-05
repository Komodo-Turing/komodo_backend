class Timer < ApplicationRecord
  belongs_to :user

  validates_presence_of :name
  validates_presence_of :duration
  validates_presence_of :substance
  validates_presence_of :dosage
end