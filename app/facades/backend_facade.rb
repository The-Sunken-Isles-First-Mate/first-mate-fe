class BackendFacade
  def self.get_user(user_hash)
    response = BackendService.call_db_for_user("/api/v1/users/#{user_hash[:uid]}", user_hash)

    User.new({
      id: response[:data][:id],
      uid: response[:data][:attributes][:uid],
      username: response[:data][:attributes][:username]
    })
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

  def self.get_management_form(id, week)
    response = BackendService.call_db_for_management_form(id, week)

    ManagementForm.new({
      id: response[:data][:id],
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
      light_armor: response[:data][:attributes][:light_armor],
      medium_armor: response[:data][:attributes][:medium_armor],
      heavy_armor: response[:data][:attributes][:heavy_armor],
      simple_weapon: response[:data][:attributes][:simple_weapon],
      martial_weapon: response[:data][:attributes][:martial_weapon],
      ammunition: response[:data][:attributes][:ammunition],
      adventuring_supplies: response[:data][:attributes][:adventuring_supplies],
      assassins_blood: response[:data][:attributes][:assassins_blood],
      malice: response[:data][:attributes][:malice],
      midnight_tears: response[:data][:attributes][:midnight_tears],
      serpent_venom: response[:data][:attributes][:serpent_venom],
      truth_serum: response[:data][:attributes][:truth_serum],
      oil_of_slipperiness: response[:data][:attributes][:oil_of_slipperiness],
      potion_of_climbing: response[:data][:attributes][:potion_of_climbing],
      potion_of_healing: response[:data][:attributes][:potion_of_healing],
      potion_of_water_breathing: response[:data][:attributes][:potion_of_water_breathing],
      barge: response[:data][:attributes][:barge],
      coracle: response[:data][:attributes][:coracle],
      double_hulled_sailing_canoe: response[:data][:attributes][:double_hulled_sailing_canoe],
      keelboat: response[:data][:attributes][:keelboat],
      raft: response[:data][:attributes][:raft],
      single_hulled_sailing_canoe: response[:data][:attributes][:single_hulled_sailing_canoe],
      ballista: response[:data][:attributes][:ballista],
      cabin: response[:data][:attributes][:cabin],
      magical_defenses: response[:data][:attributes][:magical_defenses],
      storage: response[:data][:attributes][:storage]
    })
  end

  def self.get_all_items
    response = BackendService.call_db_for_items

    response[:data].map { |item| item[:attributes][:name] }
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

  def self.patch_management_form(campaign_id, form_data)
    response = BackendService.update_db_management_form(campaign_id, form_data)
  end

  ### Not Formatted
  def self.item(id)
    BackendService.call_db("api/v1/items/#{id}")
  end
end