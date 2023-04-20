class User < ApplicationRecord
 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, 
         :validatable
  has_many :jobs_applications
  has_many :jobs, through: :jobs_applications
  # attr_writer :login


 

  # def self.find_for_database_authentication(warden_conditions)
  #   conditions = warden_conditions.dup
  #   if (login = conditions.delete(:login))
  #     where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  #   elsif conditions.has_key?(:username) || conditions.has_key?(:email)
  #     where(conditions.to_h).first
  #   end
  # end


end
