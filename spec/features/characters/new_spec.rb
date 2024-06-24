require 'rails_helper'

RSpec.describe "Characters New Page", type: :feature do
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

  it "is a form to create a new character", :vcr do
    visit new_character_path

    expect(current_path).to eq(new_character_path)

    within ".character_form" do
      expect(page).to have_content("Character Name")
      expect(page).to have_field (:name)
      expect(page).to have_button("Create Character")
    end
  end
end
