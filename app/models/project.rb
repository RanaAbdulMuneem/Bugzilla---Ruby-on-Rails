class Project < ApplicationRecord
  belongs_to :manager,  class_name: :User, foreign_key: :user_id
  has_and_belongs_to_many :developers, class_name: :user, foreign_key: :user_id
  has_and_belongs_to_many :quality_assurances, class_name: :user, foreign_key: :user_id
end
