class User < ActiveRecord::Base
  has_secure_password

  has_many :letters

  validates :email, presence: true, uniqueness: { case_sensitive: false}, length: { in: 5..50 }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i ,
    message: "enter valid email address" }

  validates :password, presence: true, length: { in: 6..30 }

end


