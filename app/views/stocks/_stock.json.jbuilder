json.extract! stock, :id, :wine_name, :producer, :country, :region, :general_notes, :vintage, :price, :amount, :bought_from, :bought_on, :cellar_id, :stock_notes, :status, :created_at, :updated_at
json.url stock_url(stock, format: :json)
