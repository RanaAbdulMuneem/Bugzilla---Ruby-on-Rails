class QualityAssurance < User
  has_many :reports_tos, foreign_key: :user_id
  has_many :projects, through: :reports_tos
end
