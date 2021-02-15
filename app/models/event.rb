class Event < ApplicationRecord
  validates :start_date, presence: true, if: :start_date_is_possible?
  validates :duration, presence: true,  numericality: { only_integer: true, greater_than: 0, :modulo => 5 }
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true,  numericality: { only_integer: true, greater_than: 0, less_than: 1000 }
  validates :location, presence: true 

  def start_date_is_possible?
    #Afficher message d'erreur à moins que "Date début > Date Aujourd'hui"
    errors.add(:start_date, "You can't create event in the past") unless start_date > DateTime.now
  end

  belongs_to :user
  has_many :attendances
  has_many :users, through: :attendances
  #belongs_to :admin, class_name: "User"
  #has_many :attendances
  #has_many :attendees, foreign_key: "attendee_id", class_name: "User", through: :attendances
end
