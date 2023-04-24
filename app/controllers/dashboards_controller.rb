class DashboardsController < ApplicationController
    before_action :authenticate_user!
    def index
        @check_admin = current_user.is_admin
        @applied_jobs = Job.where(created_by:current_user)
       if params[:search]
            @jobs = Job.where("name LIKE ?", "%#{params[:search]}%")
        else
            @jobs = Job.all
        end
    end

    def applied_users
        @applied_jobs = Job.find(params[:id])
    end

    def applied_jobs
        
         @applied_jobs =  JobsApplication.where(user_id:current_user.id)
    end

end