class User < ApplicationRecord
    enum role: { admin: 'admin', job_seeker: 'job_seeker' }

    # Include methods for JWT authentication
    has_secure_password
    validates :password_confirmation, presence: true
    validates_presence_of :email
    validates_uniqueness_of :email

    # Method to generate JWT token
    def generate_jwt
        JWT.encode({ id: id, email: email }, Rails.application.secrets.secret_key_base)
    end

    # Method to authenticate user based on credentials
    def self.authenticate(email, password)
        user = find_by(email: email)
        return user if user && user.authenticate(password)
    end
end