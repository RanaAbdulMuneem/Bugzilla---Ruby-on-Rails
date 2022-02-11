class ReportsTo < ApplicationRecord
  belongs_to :quality_assurance, class_name: :User, foreign_key: :user_id
  belongs_to :project
end
