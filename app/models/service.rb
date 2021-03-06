class Service < ApplicationRecord
  EVENT_TYPE = %w(Mariage Funerailles Anniversaires RemiseDiplomes EvenementsSportifs Concerts&sorties)
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :title, presence: true
  validates :price, presence: true
  validates :details, presence: true
  # validates :service_image, presence: true
  validates :city, presence: true
  validates :event_type, presence: true, inclusion: { in: EVENT_TYPE }
  mount_uploader :service_image, ServiceImageUploader
end
