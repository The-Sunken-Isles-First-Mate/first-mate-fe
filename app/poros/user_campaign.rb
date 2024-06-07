class UserCampaign
  attr_reader :id,
              :user_id,
              :campaign_id,
              :role,
              :character_id

  def initialize(attributes)
    @id = attributes[:id]
    @user_id = attributes[:user_id]
    @campaign_id = attributes[:campaign_id]
    @role = attributes[:role]
    @character_id = attributes[:character_id]
  end

  def campaign_name
    @campaign_name ||= BackendFacade.get_campaign(@campaign_id).name
  end
end
