require 'rails_helper'

RSpec.describe "Management Edit Page", type: :feature do
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

  it "has a button advance week and resets resources to default values", :vcr do
    visit campaign_management_path(1)

    expect(page).to have_content('Resource Management for Test Campaign')
    expect(page).to have_content('Week 0')

    expect(page).to have_content('Resources Available')

    expect(page).to have_content('Villagers')
    expect(page).to have_content('Available Villagers: 120')

    expect(page).to have_content('Essentials')
    expect(page).to have_content('Food: 0')
    expect(page).to have_content('Farmed Goods: 0')
    expect(page).to have_content('Foraged Goods: 0')

    expect(page).to have_content('Crafting Materials')
    expect(page).to have_content('Wood: 0')
    expect(page).to have_content('Stone: 0')
    expect(page).to have_content('Metal: 0')
    expect(page).to have_content('Cloth: 0')
    expect(page).to have_content('Animal Products: 0')
    expect(page).to have_content('Monster Parts: 0')

    expect(page).to have_content('Management Form')

    expect(page).to have_content('Assign Villagers - 120 Available')
    expect(page).to have_content('Food:')
    expect(page).to have_content('Farmed Goods:')
    expect(page).to have_content('Foraged Goods:')
    expect(page).to have_content('Wood:')
    expect(page).to have_content('Stone:')
    expect(page).to have_content('Metal:')
    expect(page).to have_content('Cloth:')
    expect(page).to have_content('Animal Products:')
    expect(page).to have_content('Monster Parts:')

    expect(page).to have_content('Item Crafting')
    expect(page).to have_content('Craft a:')
    expect(page).to have_content('Quantity')

    expect(page).to have_button('Update')
    expect(page).to have_button('Advance Week')
  end
end
