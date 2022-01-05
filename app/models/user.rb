class User < ApplicationRecord
  has_many :contacts
  has_many :timers

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :phone_number
  validates_presence_of :token
  validates_presence_of :google_id
end