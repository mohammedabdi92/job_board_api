class JobPostsController < ApplicationController
  before_action :authenticate_request
  before_action :admin_only, only: [:create, :update, :destroy]

  def index
    @job_posts = JobPost.all
    render json: @job_posts
  end

  def show
    @job_post = JobPost.find(params[:id])
    render json: @job_post
  end

  def create
    @job_post = JobPost.new(job_post_params)
    @job_post.created_by = @current_user
    @job_post.updated_by = @current_user

    if @job_post.save
      render json: @job_post, status: :created
    else
      render json: { error: @job_post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @job_post = JobPost.find(params[:id])
    @job_post.updated_by = @current_user

    if @job_post.update(job_post_params)
      render json: @job_post
    else
      render json: { error: @job_post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @job_post = JobPost.find(params[:id])
    @job_post.destroy
    head :no_content
  end

  private

  def job_post_params
    params.require(:job_post).permit(:title, :description)
  end
end