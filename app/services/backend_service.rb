class BackendService
  def self.call_db_for_user(url, user_hash)
    response = connection.get(url) do |request|
      request.body =
      {
        user: {
          username: user_hash[:username],
          token: user_hash[:token]
        }
      }.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.call_db_for_campaign(url)
    response = connection.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.call_db_for_campaign_items(url)
    response = connection.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.post_db_campaign(campaign_name)
    response = connection.post("/api/v1/campaigns") do |request|
      request.body =
      {
        campaign: {
          name: campaign_name,
        }
      }.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.post_db_user_campaign_dm(campaign_id, current_user)
    response = connection.post("/api/v1/user_campaigns") do |request|
      request.body =
      {
        user_campaign: {
          user_id: current_user.id,
          campaign_id: campaign_id,
          role: 1
        }
      }.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.post_db_user_campaign_pl(campaign_id, player_id)
    response = connection.post("/api/v1/user_campaigns") do |request|
      request.body =
      {
        user_campaign: {
          user_id: player_id,
          campaign_id: campaign_id,
          role: 0
        }
      }.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.post_db_character(new_character_data)
    json_data = {
      character: {
          name: new_character_data[:data][:name],
          dnd_race: new_character_data[:data][:dnd_race],
          dnd_class: new_character_data[:data][:dnd_class],
          user_id: new_character_data[:data][:user_id]
     }}
    json_payload = JSON.generate(json_data)

    response = if new_character_data[:character_image][:image].present?
      image_file = new_character_data[:character_image][:image].tempfile

      RestClient::Request.execute(
        method: :post,
        url: 'http://localhost:3000/api/v1/characters',
        payload: {
          multipart: true,
          json: json_payload,
          file: File.new(image_file, 'rb')
        },
        headers: { content_type: 'multipart/form-data' }
      )
    else
      connection.post("/api/v1/characters") do |request|
        request.body = json_payload
      end
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  ### Not formatted
  def self.call_db(url)
    response = connection.get(url) do |request|
    end
    JSON.parse(response.body, symbolize_names: true)
  end
  ###

  private
  def self.connection # Replace with hosted database once established
    Faraday.new(
      url: "http://localhost:3000/",
      headers: {'Content-Type' => 'application/json'}
    )
  end
end
