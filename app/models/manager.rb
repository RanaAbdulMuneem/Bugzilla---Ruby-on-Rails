class Manager < User
  has_many :projects, foreign_key: :user_id
end
