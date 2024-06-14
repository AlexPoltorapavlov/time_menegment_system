class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :phone_number, presence: true 
  validates :password, presence: true, confirmation: true, length: { minimum: 8 }, on: :create 

  attr_accessor :password, :password_confirmation

  before_save :downcase_email
  before_save :hash_password

  has_many :projects, dependent: :destroy

  private

  def downcase_email
    self.email = email.downcase
  end

  def hash_password
    self.password_digest = BCrypt::Password.create(password) if password.present?
  end

  def authenticate(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end
  
end
