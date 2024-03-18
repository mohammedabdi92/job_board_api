class ApplicationController < ActionController::API
  rescue_from CanCan::AccessDenied do |exception|
    render json: { error: 'Access denied' }, status: :forbidden
  end
  before_action :authenticate_request, except: [:login]

  attr_reader :current_user


  private
  def admin_only
    if current_user.nil? || current_user.role != 'admin'
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
  def authenticate_request
    token = request.headers['Authorization']&.split(' ')&.last
    
    if token.nil?
      render json: { error: 'Unauthorized: Token missing' }, status: :unauthorized
      return
    end
  
    payload = AuthenticationService.decode(token)
    if payload.nil?
      render json: { error: 'Unauthorized: Invalid token' }, status: :unauthorized
      return
    end
    
    @current_user ||= User.find(payload['id'])
    
    if @current_user.nil?
      render json: { error: 'Unauthorized: User not found' }, status: :unauthorized
      return
    end
    
    logger.debug "User: #{@current_user.role}"
  end
  
  
end