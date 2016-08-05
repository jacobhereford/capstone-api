#
class User < ActiveRecord::Base
  include Authentication
  has_many :contacts
  has_many :appointments
end
