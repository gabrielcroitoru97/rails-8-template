json.extract! favorite_place, :id, :user_id, :place_id, :note, :created_at, :updated_at
json.url favorite_place_url(favorite_place, format: :json)
