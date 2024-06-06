class BackendFacade
  def self.get_user(user_hash)
    response = BackendService.call_db_for_user("/api/v1/users/#{user_hash[:uid]}", user_hash)
    User.new({
      id: response[:data][:id],
      uid: response[:data][:attributes][:uid],
      username: response[:data][:attributes][:username]
    })
  end

  def self.get_user_campaigns(user_id)
    response = BackendService.call_db_for_user_campaigns("/api/v1/users/#{user_id}/user_campaigns")

    response[:data].map do |campaign|
      UserCampaign.new({
        user_id: campaign[:relationships][:user][:data][:id],
        campaign_id: campaign[:relationships][:campaign][:data][:id],
        role: campaign[:attributes][:role],
        character_id: (campaign[:relationships][:character][:data][:id] if campaign[:relationships][:character][:data].present?)
      })
    end
  end

  def self.get_campaign(campaign_id)
    response = BackendService.call_db_for_campaign("/api/v1/campaigns/#{campaign_id}")

    Campaign.new({
      id: response[:data][:id],
      name: response[:data][:attributes][:name],
      week: response[:data][:attributes][:week],
      animal_products: response[:data][:attributes][:animal_products],
      cloth: response[:data][:attributes][:cloth],
      farmed_goods: response[:data][:attributes][:farmed_goods],
      food: response[:data][:attributes][:food],
      foraged_goods: response[:data][:attributes][:foraged_goods],
      metal: response[:data][:attributes][:metal],
      monster_parts: response[:data][:attributes][:monster_parts],
      stone: response[:data][:attributes][:stone],
      wood: response[:data][:attributes][:wood],
      villagers: response[:data][:attributes][:villagers]
    })
  end

  def self.get_campaign_items(campaign_id)
    response = BackendService.call_db_for_campaign_items("/api/v1/campaigns/#{campaign_id}/items")

    response[:data].map do |item|
      Item.new({
        name: self.item(item[:attributes][:item_id])[:data][:attributes][:name],
        quantity: item[:attributes][:quantity_owned]
      })
    end
  end

  def self.create_campaign(campaign_name)
    response = BackendService.post_db_campaign(campaign_name)

    Campaign.new({
      id: response[:data][:id],
      name: response[:data][:attributes][:name],
      week: response[:data][:attributes][:week],
      animal_products: response[:data][:attributes][:animal_products],
      cloth: response[:data][:attributes][:cloth],
      farmed_goods: response[:data][:attributes][:farmed_goods],
      food: response[:data][:attributes][:food],
      foraged_goods: response[:data][:attributes][:foraged_goods],
      metal: response[:data][:attributes][:metal],
      monster_parts: response[:data][:attributes][:monster_parts],
      stone: response[:data][:attributes][:stone],
      wood: response[:data][:attributes][:wood],
      villagers: response[:data][:attributes][:villagers]
    })
  end

  def self.create_user_campaign_dm(campaign_id, current_user)
    response = BackendService.post_db_user_campaign_dm(campaign_id, current_user)

    Dm.new({
      id: response[:data][:id],
      campaign_id: response[:data][:relationships][:campaign][:data][:id]
    })
  end

  def self.create_user_campaign_pl(campaign_id, player_id)
    response = BackendService.post_db_user_campaign_pl(campaign_id, player_id)

    Pl.new({
      id: response[:data][:id],
      campaign_id: response[:data][:relationships][:campaign][:data][:id]
    })
  end

  def self.create_character(new_character_data)
    response = BackendService.post_db_character(new_character_data)

    Character.new({
      id: response[:data][:id],
      name: response[:data][:attributes][:name],
      user_id: response[:data][:attributes][:user_id],
      race: response[:data][:attributes][:dnd_race],
      class: response[:data][:attributes][:dnd_class],
      image_url: response[:data][:attributes][:image_url]
    })
  end

  ### Not Formatted
  def self.item(id)
    BackendService.call_db("api/v1/items/#{id}")
  end
end
