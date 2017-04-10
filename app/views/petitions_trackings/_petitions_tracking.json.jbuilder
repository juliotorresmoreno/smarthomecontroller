json.extract! petitions_tracking, :id, :petition_tracking_id, :state, :petition_id, :user_id, :comemnt, :created_at, :update_at, :delete_at, :created_at, :updated_at
json.url petitions_tracking_url(petitions_tracking, format: :json)
