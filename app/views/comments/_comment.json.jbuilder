json.extract! comment, :id, :commenter_id, :location_id, :content, :created_at, :updated_at
json.url comment_url(comment, format: :json)
