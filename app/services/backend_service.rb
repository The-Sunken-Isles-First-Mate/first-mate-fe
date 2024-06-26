class BackendService
  def self.call_db_for_user(user_hash)
    response = connection.get("users/#{user_hash[:uid]}") do |request|
      request.body =
      {
        user: {
          username: user_hash[:username],
          password: user_hash[:password]
        }
      }.to_json
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.call_db_for_user_all(user_hash)
    response = connection.get("users") do |request|
      request.body =
      {
        user: {
          username: user_hash[:username],
          password: user_hash[:password]
        }
      }.to_json
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.patch_db_for_user_campaign(params)
    response = connection.patch("user_campaigns/#{params[:user_campaign_id]}") do |request|
      request.body = {
        user_campaign: {
          character_id: params[:character_id]
        }
      }.to_json
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.call_db_for_user_campaigns(url)
    response = connection.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.call_db_for_campaign(campaign_id)
    response = connection.get("campaigns/#{campaign_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.call_db_for_campaign_items(campaign_id)
    response = connection.get("campaigns/#{campaign_id}/items")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.call_db_for_management_form(id, week)
    response = connection.get('management_form') do |request|
      request.body =
      {
        campaign_id: id,
        week: week
      }.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.call_db_for_items
    response = connection.get('items')
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.call_db_for_campaign_characters(campaign_id)
    response = connection.get("campaigns/#{campaign_id}/characters")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.post_db_campaign(campaign_name)
    response = connection.post("campaigns") do |request|
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
    response = connection.post("user_campaigns") do |request|
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

  def self.post_db_user_campaign_pl(campaign_id, player_email)
    response = connection.post("user_campaigns") do |request|
      request.body =
      {
        user_campaign: {
          username: player_email,
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
        url: "#{api_base_url}/api/v1/characters",
        payload: {
          multipart: true,
          json: json_payload,
          file: File.new(image_file, 'rb')
        },
        headers: { content_type: 'multipart/form-data' }
      )
    else
      connection.post("characters") do |request|
        request.body = json_payload
      end
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.update_db_management_form(campaign_id, form_data)
    response = connection.patch("management_forms/#{campaign_id}") do |request|
      request.body =
      {
        management_form: form_data
      }.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.post_db_advance_week(campaign_id, management_form)
    response = connection.post("campaigns/#{campaign_id}/advance_week") do |request|
      request.body =
      {
        campaign: {
          campaign_id: campaign_id,
          week: management_form.week,
          animal_products: management_form.animal_products,
          cloth: management_form.cloth,
          farmed_goods: management_form.farmed_goods,
          food: management_form.food,
          foraged_goods: management_form.foraged_goods,
          metal: management_form.metal,
          monster_parts: management_form.monster_parts,
          stone: management_form.stone,
          wood: management_form.wood,
          light_armor: management_form.light_armor,
          medium_armor: management_form.medium_armor,
          heavy_armor: management_form.heavy_armor,
          simple_weapon: management_form.simple_weapon,
          martial_weapon: management_form.martial_weapon,
          ammunition: management_form.martial_weapon,
          adventuring_supplies: management_form.adventuring_supplies,
          assassins_blood: management_form.assassins_blood,
          malice: management_form.malice,
          midnight_tears: management_form.midnight_tears,
          serpent_venom: management_form.serpent_venom,
          truth_serum: management_form.truth_serum,
          oil_of_slipperiness: management_form.oil_of_slipperiness,
          potion_of_climbing: management_form.potion_of_climbing,
          potion_of_healing: management_form.potion_of_healing,
          potion_of_water_breathing: management_form.potion_of_water_breathing,
          barge: management_form.barge,
          coracle: management_form.coracle,
          double_hulled_sailing_canoe: management_form.double_hulled_sailing_canoe,
          keelboat: management_form.keelboat,
          raft: management_form.raft,
          single_hulled_sailing_canoe: management_form.single_hulled_sailing_canoe,
          ballista: management_form.ballista,
          cabin: management_form.cabin,
          magical_defenses: management_form.magical_defenses,
          storage: management_form.storage
        }
      }.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.call_db(url)
    response = connection.get(url) do |request|
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.api_base_url
    ENV['API_BASE_URL']
  end

  def self.connection
    Faraday.new(
      url: "#{api_base_url}/api/v1",
      headers: {'Content-Type' => 'application/json'}
    )
  end
end
