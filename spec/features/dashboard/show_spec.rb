require 'rails_helper'

RSpec.describe "Dashboard Show Page", type: :feature do
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
    allow(@user1).to receive(:user_campaigns).and_return([@user_campaign1, @user_campaign2, @user_campaign3])
  end

  it "has a welcome message for the user" do
    visit dashboard_path

    expect(page).to have_content("Welcome, coolusername to The Sunken Isles!")
  end

  it "has a button for creating a campaign" do
    visit dashboard_path

    expect(page).to have_button('Create Campaign')
    click_button('Create Campaign')

    expect(current_path).to eq(new_campaign_path)
  end

  it "has a button for creating a character if you have been invited to a campaign and have not made a character for it", :vcr do
    visit dashboard_path

    within '#invited-campaigns' do
      expect(page).to_not have_button('Create Character for Campaign 2')
      expect(page).to have_button('Create Character for Campaign 1')

      click_button('Create Character for Campaign 1')
    end

    expect(current_path).to eq(new_character_path)
  end

  it "has links to all campaigns that you are a part of and seperated into sections depending on if you're a dm or party member", :vcr do
    visit dashboard_path

    within '#dm-campaigns' do
      expect(page).to_not have_link('#1')
      expect(page).to_not have_link('#2')
      expect(page).to have_link('#3')

      click_link('#3')

      expect(current_path).to eq(campaign_summary_path(3))
    end

    visit dashboard_path

    within '#party-campaigns' do
      expect(page).to_not have_link('#1')
      expect(page).to have_link('#2')
      expect(page).to_not have_link('#3')

      click_link('#2')

      expect(current_path).to eq(campaign_summary_path(2))
    end
  end
end
