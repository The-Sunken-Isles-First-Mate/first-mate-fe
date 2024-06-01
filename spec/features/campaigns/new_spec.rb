require 'rails_helper'

RSpec.describe "Campaigns New Page", type: :feature do
  it "is a form to create a new campaign" do
    visit new_campaign_path

    expect(current_path).to eq(new_campaign_path)

    within ".campaign_form" do
      expect(page).to have_content("Campaign Name")
      expect(page).to have_field (:name)
      expect(page).to have_content("Invite Players by Email")
      expect(page).to have_field (:player_1)
      expect(page).to have_field (:player_2)
      expect(page).to have_field (:player_3)
      expect(page).to have_field (:player_4)
      expect(page).to have_button("Create Campaign")
    end
  end
end