class User < ApplicationRecord
  include Clearance::User
  has_many :projects, dependent: :destroy
end
