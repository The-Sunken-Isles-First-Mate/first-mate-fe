class UserCampaign
  attr_reader :user_id,
              :campaign_id,
              :role,
              :character_id

  def initialize(attributes)
    @user_id = attributes[:user_id]
    @campaign_id = attributes[:campaign_id]
    @role = attributes[:role]
    @character_id = attributes[:character_id]
  end
end
