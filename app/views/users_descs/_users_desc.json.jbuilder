json.extract! users_desc, :id, :user_desc_id, :state, :sex_id, :city_residence_id, :phone, :address, :cell_phone, :birth_date, :user_id, :created_at, :updated_at
json.url users_desc_url(users_desc, format: :json)
