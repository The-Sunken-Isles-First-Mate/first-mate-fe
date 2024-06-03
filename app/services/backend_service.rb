class BackendService
  def self.call_db(url)
    response = connection.get(url) do |request|
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.post_db(data)
    url = data[:url]
    response = connection.post(url) do |request|
      request.body = 
      {
        character: {
          name: data[:name],
          dnd_race: data[:dnd_race],
          dnd_class: data[:dnd_class],
          user_id: data[:user_id],
          picture_url: nil
        }
      }.to_json
    end

    json = JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.connection
    # td: replace with hosted database once established
    Faraday.new(
      url: 'http://localhost:3000/',
      headers: {'Content-Type' => 'application/json'}
    )
  end
end