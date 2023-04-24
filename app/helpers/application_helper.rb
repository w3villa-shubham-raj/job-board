module ApplicationHelper

   def user_name(user_id)
        User.find(user_id)
   end
   
   def job_name(job_id)
    Job.find(job_id)
   end

   def render_job_creator_names(jobs)
    jobs.map do |job|
      User.find(job.created_by).username
    end.join(", ")
  end
end
