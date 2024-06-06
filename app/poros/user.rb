class User
  attr_reader :id,
              :uid,
              :username

  def initialize(data)
    @id = data[:id]
    @uid = data[:uid]
    @username = data[:username]
  end

  def user_campaigns
    @user_campaigns ||= BackendFacade.get_user_campaigns(@id)
  end

  def dm_campaigns
    user_campaigns.select do |campaign|
      campaign.role == 'dm'
    end
  end

  def party_campaigns
    user_campaigns.select do |campaign|
      campaign.role == 'party_member' &&
      campaign.character_id.present?
    end
  end

  def invited_campaigns
    user_campaigns.select do |campaign|
      campaign.role == 'party_member' &&
      campaign.character_id.nil?
    end
  end
end
