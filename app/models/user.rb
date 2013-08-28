class User < ActiveRecord::Base
	has_secure_password
	validates :name, presence: true, length: { maximum: 30 }
	validates :email, format: { with: /\A[^@]+@[^@]+\z/ }, uniqueness: true
	before_save { self.email = email.downcase }
end
