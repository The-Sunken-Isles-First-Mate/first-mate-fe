require 'rails_helper'

RSpec.describe "Party Index Page", type: :feature do
  before(:each) do
    @user1 = User.new(id: 1, uid: 1234567890, username: 'coolusername')
    @user_campaign1 = UserCampaign.new(
      id: 1,
      role: "party_member",
      character_id: nil,
      campaign_id: 1,
      user_id: 1
      )
    @user_campaign2 = UserCampaign.new(
      id: 2,
      role: "party_member",
      character_id: 5,
      campaign_id: 2,
      user_id: 1
      )
    @user_campaign3 = UserCampaign.new(
      id: 3,
      role: "dm",
      character_id: nil,
      campaign_id: 3,
      user_id: 1
      )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
  end

  it 'has all information', :vcr do
    visit campaign_party_path(1)

    expect(page).to have_content('Party')

    expect(page).to have_content('Test Character 1')
    expect(page).to have_content('Race: Dragonborn')
    expect(page).to have_content('Class: Barbarian')

    expect(page).to have_content('Test Character 2')
    expect(page).to have_content('Race: Human')
    expect(page).to have_content('Class: Bard')
  end
end
