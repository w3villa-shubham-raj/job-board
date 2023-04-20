json.extract! job, :id, :name, :description, :total_post, :ctc, :created_at, :updated_at
json.url job_url(job, format: :json)
