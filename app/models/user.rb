# User Model
class User < ApplicationRecord
  EMAIL_VALID_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,                  presence:     true,
                                    length:       { in: 2..64 }

  validates :email,                 presence:     true,
                                    length:       { in: 5..64 },
                                    format:       { with: EMAIL_VALID_REGEX },
                                    uniqueness:   { case_sensitive: false }

  validates :password,              presence:     true,
                                    confirmation: true,
                                    length:       { in: 6..64 }

  validates :password_confirmation, presence: true

  before_save :encrypt_password, :email_lowercase
  after_save  :clear_password

  def email_lowercase
    self.email = email.downcase
  end

  def encrypt_password
    self.password = Digest::SHA1.hexdigest(password) if password.present?
  end

  def clear_password
    self.password = nil
  end
end
