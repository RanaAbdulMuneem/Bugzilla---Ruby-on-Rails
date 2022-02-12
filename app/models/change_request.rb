class ChangeRequest < ApplicationRecord
  belongs_to :project
  belongs_to :quality_assurance, class_name: :User, foreign_key: :user_id

  has_many :assignments
  has_many :developers, through: :assignments

  enum type: {
    Bug: 1,
    Feature: 2
  }
end
