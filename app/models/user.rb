class User < ApplicationRecord
  acts_as_paranoid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #  :confirmable

  has_many :projects, dependent: :destroy

  enum role: { owner: 'owner', admin: 'admin' }
end
