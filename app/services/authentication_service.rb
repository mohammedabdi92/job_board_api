class AuthenticationService
  def self.encode(payload)
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def self.decode(token)
    JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
  rescue JWT::DecodeError
    nil
  end
end