class User < ActiveRecord::Base
    has_secure_password
    validates :password, confirmation: true

    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
    validates :email, uniqueness: true
    validates :first_name, length: { maximum: 30 }
    validates :last_name, length: { maximum: 30 }
    validates :username, presence: true
    validates :username, uniqueness: true

end
