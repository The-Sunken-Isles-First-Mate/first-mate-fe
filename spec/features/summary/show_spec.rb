require 'rails_helper'

RSpec.describe "Summary Show Page", type: :feature do
  it "has the campaigns name, week and lists its resources, villagers and owned items", :vcr do
    visit campaign_summary_path(1)

    expect(page).to have_content('Summary for Test Campaign')

    within '#campaign_summary' do
      expect(page).to have_content('Week 0')
      expect(page).to have_content('Current Villagers: 120')

      within '#campaign_summary_resources' do
        expect(page).to have_content("Animal Products: 0")
        expect(page).to have_content("Cloth: 0")
        expect(page).to have_content("Farmed Goods: 0")
        expect(page).to have_content("Food: 0")
        expect(page).to have_content("Foraged Goods: 0")
        expect(page).to have_content("Metal: 0")
        expect(page).to have_content("Monster Parts: 0")
        expect(page).to have_content("Stone: 0")
        expect(page).to have_content("Wood: 0")
      end

      within '#campaign_summary_items' do
      expect(page).to have_content("Light armor: 0")
      expect(page).to have_content("Medium armor: 0")
      expect(page).to have_content("Heavy armor: 0")
      expect(page).to have_content("Potion of climbing: 0")
      expect(page).to have_content("Potion of healing: 0")
      expect(page).to have_content("Potion of water breathing: 0")
      end
    end
  end
end
