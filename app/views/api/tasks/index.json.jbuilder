json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :completed
  json.url task_url(task, format: :json)
  json.lastSyncAt task.updated_at.strftime("%Y-%m-%d %H:%M:%I")
end
