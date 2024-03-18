class JobApplicationsController < ApplicationController
    before_action :authenticate_request
    before_action :admin_only, only: [:index, :show, :update, :destroy ,:mark_as_seen]
  
    def index
      @job_applications = JobApplication.all
      render json: @job_applications
    end
  
    def show
      @job_application = JobApplication.find(params[:id])
      render json: @job_application
    end
  
    def create
        logger.debug "Params received: #{params.inspect}"
        
        @job_application = JobApplication.new(job_application_params)
        
        # Assign job_seeker_id using the ID of the current user
        @job_application.job_seeker_id = @current_user.id
      
        if @job_application.save
          render json: @job_application, status: :created
        else
          render json: @job_application.errors, status: :unprocessable_entity
        end
      end
  
    def update
      @job_application = JobApplication.find(params[:id])
      if @job_application.update(job_application_params)
        render json: @job_application
      else
        render json: @job_application.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @job_application = JobApplication.find(params[:id])
      @job_application.destroy
    end

    def mark_as_seen
        @job_application = JobApplication.find(params[:id])
        @job_application.update(status: 'Seen')
        render json: @job_application
    end
  
    private
  
    def job_application_params
        params.permit( :job_post_id)
    end
end
  