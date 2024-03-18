class UsersController < ApplicationController
    before_action :admin_only, only: [:index, :destroy]
 
  
    def index
        @users = User.all
        render json: @users
    end
    def registration
      @user = User.new(user_params)
      @user.role = 'job_seeker' 
      if @user.save
        render json: { message: 'User created successfully' }
      else
        render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end
    def login
        user = User.authenticate(params[:email], params[:password])
        if user
          render json: { token: user.generate_jwt }
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
    end
    def destroy
        user = User.find(params[:id])
        if user.destroy
          render json: { message: 'User deleted successfully' }
        else
          render json: { error: 'Failed to delete user' }, status: :unprocessable_entity
        end
      end
  
    private
    
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end