class ApplicationController < ActionController::API
  require 'jwt'

  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JWT.decode(header, SECRET_KEY)[0]
      @current_user = User.find(@decoded['user_id'])
    rescue ActiveRecord::RecordNotFound, JWT::DecodeError
      render json: { errors: 'Unauthorized' }, status: :unauthorized
    end
  end
end
