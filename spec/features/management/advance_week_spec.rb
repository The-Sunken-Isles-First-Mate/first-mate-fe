require 'rails_helper'

RSpec.describe "Advance Week", type: :feature do

  before(:each) do
    @campaign1 = create(:campaign)
  end

  it "has a button advance week and resets resources to default values" do
    visit campaign_management_path(@campaign1)

    expect(current_path).to eq(campaign_management_path(@campaign1))
    expect(page).to have_content("Week 0")
    expect(page).to have_button("Advance Week")
    click_on "Advance Week"
    expect(current_path).to eq(campaign_management_path(@campaign1))
    expect(page).to have_content("Week 1")
    expect(page).to_not have_content("Week 0")

    within ".resources_available" do

      expect(page).to have_content("Resources Available")
      expect(page).to have_content("Villagers: 120")
      expect(page).to have_content("Animal Products: 0")
      expect(page).to have_content("Cloth: 0")
      expect(page).to have_content("Wood: 0")
      expect(page).to have_content("Stone: 0")
      expect(page).to have_content("Metal: 0")
      expect(page).to have_content("Food: 0")
      expect(page).to have_content("Farmed Goods: 0")
      expect(page).to have_content("Foraged Goods: 0")
      expect(page).to have_content("Monster Parts: 0")
    end
  end
end