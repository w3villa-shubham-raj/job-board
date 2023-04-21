module ApplicationHelper

   def user_name(user_id)
        User.find(user_id)
   end
   
   def job_name(job_id)
    Job.find(job_id)
   end
end
