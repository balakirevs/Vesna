# == Schema Information
#
# Table name: users
#
#  id            :integer         not null, primary key
#  surname       :string(255)
#  name          :string(255)
#  middle_name   :string(255)
#  date_of_birth :string(255)
#  city          :string(255)
#  phone         :string(255)
#  email         :string(255)
#  image_url     :string(255)
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible :city, :date_of_birth, :email, :image_url, :middle_name, :name, :phone, :surname, :password, :password_confirmation
  has_secure_password

  before_save { |user| user.email = email.downcase }

  validates :name,          presence: true, length: { maximum: 50 }
  validates :surname,       presence: true, length: { maximum: 50 }
  validates :middle_name,   presence: true, length: { maximum: 50 }
  validates :date_of_birth, presence: true
  validates :city,          presence: true, length: { maximum: 20 }
  validates :phone,         presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,         presence: true, format: { with: VALID_EMAIL_REGEX },
                            uniqueness: { case_sensitive: false }
  #validates :image_url,    presence: true
  validates :password,      presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
