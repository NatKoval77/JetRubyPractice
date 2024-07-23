json.extract! lab_report, :id, :user_id, :title, :description, :grade, :created_at, :updated_at
json.url lab_report_url(lab_report, format: :json)
