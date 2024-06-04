class BackendService
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

  def self.post_db_user_campaign_dm(campaign_id, main_user)
    response = connection.post("/api/v1/user_campaigns") do |request|
      request.body = 
      {
        user_campaign: {
          user_id: main_user.id,
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
    response = connection.post("api/v1/characters") do |request|
      request.body = 
      {
        character: {
          name: new_character_data[:name],
          dnd_race: new_character_data[:dnd_race],
          dnd_class: new_character_data[:dnd_class],
          user_id: new_character_data[:user_id],
          picture_url: nil
        }
      }.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

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