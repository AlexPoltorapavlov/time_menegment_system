class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects, dependent: :destroy

  # validates :phonenumber, format: { with: /\A\+\d{8,15}\z/,
  #                                   message: 'Неверный формат номера телефона' }
end
