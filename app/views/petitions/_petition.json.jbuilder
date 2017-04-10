json.extract! petition, :id, :petition_id, :state, :user_id, :petition_type_id, :title, :description, :created_at, :update_at, :delete_at, :created_at, :updated_at
json.url petition_url(petition, format: :json)
