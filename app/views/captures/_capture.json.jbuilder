json.extract! capture, :id, :name, :imgurl, :url_id, :created_at, :updated_at
json.url capture_url(capture, format: :json)
