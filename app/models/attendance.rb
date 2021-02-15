class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event
  #belongs_to :event
  #belongs_to :attendee, class_name: "User"
end
