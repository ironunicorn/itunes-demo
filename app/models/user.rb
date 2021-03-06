# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
	validates :email, :session_token, presence: true, uniqueness: true
	validates :password_digest, presence: true
	validates :password, length: { minimum: 5, allow_blank: true }

	after_initialize :ensure_session_token

	has_many :notes

	attr_reader :password

	def self.generate_session_token
		SecureRandom.urlsafe_base64
	end

	def self.find_by_credentials(email, password)
		user = User.find_by_email(email)
		return nil unless user 
		user.is_password?(password) ? user : nil
	end

	def reset_session_token!
		self.session_token = User.generate_session_token
		save
	end

	def ensure_session_token
		self.session_token ||= User.generate_session_token
	end

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

	def is_password?(password)
		BCrypt::Password.new(self.password_digest).is_password?(password)
	end

end
