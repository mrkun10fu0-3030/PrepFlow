json.extract! prep_task, :id, :user_id, :title, :target_qty, :actual_qty, :prep_date, :comment, :completed, :created_at, :updated_at
json.url prep_task_url(prep_task, format: :json)
