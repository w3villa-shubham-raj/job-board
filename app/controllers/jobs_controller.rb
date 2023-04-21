class JobsController < ApplicationController
  before_action :set_job, only: %i[  edit update destroy  ]
before_action :check_user_role, only: %i[ new edit update destroy  ]
  def index
    @jobs = Job.all
  end

  def show
        @job = Job.find(params[:id])
  end

  def job_application
    job_application = JobsApplication.new(job_applications_params)

      if job_application.save
        job = Job.find(job_application.job_id)
        job.update(total_post: job.total_post.to_i - 1)
        
        if job.total_post.to_i == 0
          flash[:notice] = "Job post is now closed"
        end

        redirect_to job_path(job)
      else
        render :new
      end
  end

  def new
    @job = Job.new
  end

  def edit
  end

  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to job_url(@job), notice: "Job was successfully created." }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to job_url(@job), notice: "Job was successfully updated." }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to request.referer, notice: "Job was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:name, :description, :total_post, :ctc,:created_by,:active)
    end

    def job_applications_params
      params.permit(:user_id, :job_id)
    end
end
