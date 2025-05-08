json.extract! image, :id, :location_id, :poster_id, :picture, :created_at, :updated_at
json.url image_url(image, format: :json)
