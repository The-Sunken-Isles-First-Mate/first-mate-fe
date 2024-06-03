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
end