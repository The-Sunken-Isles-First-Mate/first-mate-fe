require 'rails_helper'

RSpec.describe User do
  it 'exists and has attributes' do
    user = User.new({
      id: 1,
      uid: 10,
      username: 'coolusername'
    })

    expect(user).to be_a(User)
    expect(user.id).to eq(1)
    expect(user.uid).to eq(10)
    expect(user.username).to eq('coolusername')
  end

  describe '#user_campaigns', :vcr do
    it 'returns all of a users user campaigns' do
      user = User.new({
        id: 1,
        uid: 10,
        username: 'coolusername'
      })

      expect(user.user_campaigns).to all be_a UserCampaign
    end
  end

  describe '#dm_campaigns', :vcr do
    it 'returns all of a users user campaigns where they are dm' do
      user = User.new({
        id: 1,
        uid: 10,
        username: 'coolusername'
      })

      campaigns = user.user_campaigns

      campaigns.each do |campaign|
        expect(campaign.role).to eq('dm')
      end
    end
  end

  describe '#party_campaigns', :vcr do
    it 'returns all of a users user campaigns where they are a party member' do
      user = User.new({
        id: 2,
        uid: 10,
        username: 'coolusername'
      })

      campaigns = user.user_campaigns

      campaigns.each do |campaign|
        expect(campaign.role).to eq('party_member')
      end
    end
  end
end
