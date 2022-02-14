class Project < ApplicationRecord
  validates :title, presence: true

  belongs_to :manager,  class_name: :User, foreign_key: :user_id

  has_many :works_ons, dependent: :destroy
  has_many :developers, through: :works_ons

  has_many :reports_tos, dependent: :destroy
  has_many :quality_assurances, through: :reports_tos

  has_many :change_requests, dependent: :destroy
end
