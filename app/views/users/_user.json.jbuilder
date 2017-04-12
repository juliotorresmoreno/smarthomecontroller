json.extract! user, :id, :user_id, :state, :name, :lastname, :fullname, :email, :password, :perfil_id, :created_at, :update_at, :delete_at, :created_at, :updated_at
json.url user_url(user, format: :json)
