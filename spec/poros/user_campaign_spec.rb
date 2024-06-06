require 'rails_helper'

RSpec.describe UserCampaign do
  it 'exists and has attributes' do
    user_campaign = UserCampaign.new({
      id: 5,
      user_id: 10,
      campaign_id: 4,
      role: 'party_member',
      character_id: 5
    })

    expect(user_campaign).to be_a(UserCampaign)
    expect(user_campaign.id).to eq(5)
    expect(user_campaign.user_id).to eq(10)
    expect(user_campaign.campaign_id).to eq(4)
    expect(user_campaign.role).to eq('party_member')
    expect(user_campaign.character_id).to eq(5)
  end
end
