class BackendFacade
  def self.create_campaign(campaign_name)
    response = BackendService.post_db_campaign(campaign_name)
    campaign = DndCampaign.new({
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

  def self.create_user_campaign_dm(campaign_id, main_user)
    response = BackendService.post_db_user_campaign_dm(campaign_id, main_user)
    dm = Dm.new({
      id: response[:data][:id],
      campaign_id: response[:data][:relationships][:campaign][:data][:id]
    })
  end

  def self.create_user_campaign_pl(campaign_id, player_id)
    response = BackendService.post_db_user_campaign_pl(campaign_id, player_id)
    pl = Pl.new({
      id: response[:data][:id],
      campaign_id: response[:data][:relationships][:campaign][:data][:id]
    })
  end

  def self.create_character(new_character_data)
    response = BackendService.post_db_character(new_character_data)
    character = Character.new({
      id: response[:data][:id],
      name: response[:data][:attributes][:name],
      user_id: response[:data][:attributes][:user_id],
      race: response[:data][:attributes][:dnd_race],
      class: response[:data][:attributes][:dnd_class],
      image_url: response[:data][:attributes][:image_url]
    })
  end

  def self.get_user(user_hash)
    response = BackendService.call_db_for_user("/api/v1/users/#{user_hash[:uid]}", user_hash)
    user = User.new({
      id: response[:data][:id],
      uid: response[:data][:attributes][:uid],
      username: response[:data][:attributes][:username]
    })
  end

  ### Not Formatted
  def self.item(id)
    response = BackendService.call_db("api/v1/items/#{id}")
  end

  # def self.campaign_items(id, camp_id)
  # end

  # def self.campaigns
  # end

  # def self.management_forms(camp_id)
  # end
  ###
end