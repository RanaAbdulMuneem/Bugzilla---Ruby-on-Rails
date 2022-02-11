class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects

  # enum type: {
  #   Manager: 1,
  #   Developer: 2,
  #   QualityAssurance: 3
  # }
end
