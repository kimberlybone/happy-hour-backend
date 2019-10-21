class ApplicationController < ActionController::API

  def authentication_json(user_id)
    {token: make_token(user_id), user_id: user_id}
  end

  def make_token(user_id)
    payload = {user_id: user_id}
    JWT.encode(payload, hmac_secret, 'HS256')
  end

  def logged_in_user_id
    token = request.headers["Authorization"]

    begin
      decoded_payload = JWT.decode(token, hmac_secret, true, {algorithm: 'HS256'})
      return decoded_payload.first["user_id"].to_i
    rescue
      return nil
    end
  end

  def logged_in?
    !!logged_in_user_id
  end

  def hmac_secret
    ENV["JWT_SECRET_KEY"]
  end

end
