class Job < ApplicationRecord
  has_many :jobs_applications, dependent: :destroy
  has_many :users, through: :jobs_applications

  has_one_attached :image

end
