class MessageController < ApplicationController
    before_action :authenticate_user!
    def index
        @job_applications = current_user.jobs
    end
end
