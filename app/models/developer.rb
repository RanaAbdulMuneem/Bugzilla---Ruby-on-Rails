class Developer < User
  has_many :works_ons, foreign_key: :user_id
  has_many :projects, through: :works_ons

  has_many :assignments, foreign_key: :user_id
  has_many :change_requests, through: :assignments
end
