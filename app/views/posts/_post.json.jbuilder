json.extract! post, :id, :poster, :subject, :body, :board_id, :created_at, :updated_at
json.url post_url(post, format: :json)
