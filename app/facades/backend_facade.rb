class BackendFacade 
  def self.item(id)
    response = BackendService.call_db("api/v1/items/#{id}")
    # poro?
  end

  def self.campaign_items(id, camp_id)
  end

  def self.campaigns 
  end

  def self.management_forms(camp_id)
  end

  def self.create_character(data)
    response = BackendService.post_db_character(data)
  end

  def self.create_campaign(data)
    response = BackendService.post_db_campaign(data)
  end

  def self.create_user_campaign_dm(campaign_id, current_user)
    response = BackendService.post_db_user_campaign_dm(campaign_id, current_user)
  end

  def self.get_user(user_hash)
    response = BackendService.call_db_for_user("/api/v1/users/#{user_hash[:uid]}", user_hash)
  end
end