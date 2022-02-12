class Project < ApplicationRecord
  belongs_to :manager,  class_name: :User, foreign_key: :user_id
  has_many :works_ons
  has_many :developers, through: :works_ons

  has_many :reports_tos
  has_many :quality_assurances, through: :reports_tos

  has_many :change_requests
end
