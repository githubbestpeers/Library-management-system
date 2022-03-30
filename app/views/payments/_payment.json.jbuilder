json.extract! payment, :id, :password_hash, :pay, :created_at, :updated_at
json.url payment_url(payment, format: :json)
