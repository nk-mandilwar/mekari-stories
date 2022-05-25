class JsonWebToken
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s
  DAY_TO_EXPIRY = 1

  def self.encode(payload)
    exp = (Time.now + DAY_TO_EXPIRY.day)
    payload[:exp] = exp.to_i
    return JWT.encode(payload, SECRET_KEY), exp
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end
end