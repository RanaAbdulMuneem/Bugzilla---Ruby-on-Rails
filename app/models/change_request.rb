class ChangeRequest < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :type, presence: true
  validates :title, presence: true

  belongs_to :project
  belongs_to :quality_assurance, class_name: :User, foreign_key: :user_id

  has_many :assignments
  has_many :developers, through: :assignments

  has_one_attached :screen_shot, dependent: :destroy

  enum type: {
    Bug: 1,
    Feature: 2
  }
end
