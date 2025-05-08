json.extract! rating, :id, :user_id, :location_id, :overall_rating, :content, :wifi_rating, :crowding_rating, :noise_rating, :outlet_rating, :comfort_and_workspace_rating, :created_at, :updated_at
json.url rating_url(rating, format: :json)
