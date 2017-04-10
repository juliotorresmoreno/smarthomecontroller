json.extract! session, :id, :session_id, :state, :user_id, :token, :expires, :created_at, :update_at, :delete_at, :created_at, :updated_at
json.url session_url(session, format: :json)
