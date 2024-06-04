class BackendService
  def self.call_db(url)
    response = connection.get(url) do |request|
    end

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.post_db_character(data)
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
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.post_db_campaign(data)
    url = data[:url]
    response = connection.post(url) do |request|
      request.body = 
      {
        campaign: {
          name: data[:name],
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

  def self.call_db_for_user(url, user_hash)
    response = connection.get(url) do |request|
      request.body = 
      {
        user: {
          username: user_hash[:username],
          token: user_hash[:token],
        }
      }.to_json
    end
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