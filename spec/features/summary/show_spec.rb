require 'rails_helper'

RSpec.describe "Summary Show Page", type: :feature do
  it "has the campaigns name, week and lists its resources, villagers and owned items", :vcr do
    visit campaign_summary_path(1)

    expect(page).to have_content('Summary for Test Campaign')
    expect(page).to have_content('Week 0')
    expect(page).to have_content('Current Villagers: 120')

    expect(page).to have_content('Resources')

    expect(page).to have_content("Animal Products: 0")
    expect(page).to have_content("Cloth: 0")
    expect(page).to have_content("Farmed Goods: 0")
    expect(page).to have_content("Food: 0")
    expect(page).to have_content("Foraged Goods: 0")
    expect(page).to have_content("Metal: 0")
    expect(page).to have_content("Monster Parts: 0")
    expect(page).to have_content("Stone: 0")
    expect(page).to have_content("Wood: 0")

    expect(page).to have_content('Owned Items')

    expect(page).to have_content("Light armor: 0")
    expect(page).to have_content("Medium armor: 0")
    expect(page).to have_content("Heavy armor: 0")
    expect(page).to have_content("Potion of climbing: 0")
    expect(page).to have_content("Potion of healing: 0")
    expect(page).to have_content("Simple weapon: 0")
    expect(page).to have_content("Martial weapon: 0")
    expect(page).to have_content("Ammunition: 0")
    expect(page).to have_content("Ammunition: 0")
    expect(page).to have_content("Adventuring supplies: 0")
    expect(page).to have_content("Assassin's blood: 0")
    expect(page).to have_content("Malice: 0")
    expect(page).to have_content("Midnight tears: 0")
    expect(page).to have_content("Serpent venom: 0")
    expect(page).to have_content("Truth serum: 0")
    expect(page).to have_content("Oil of slipperiness: 0")
    expect(page).to have_content("Potion of water breathing: 0")
    expect(page).to have_content("Barge: 0")
    expect(page).to have_content("Coracle: 0")
    expect(page).to have_content("Double hulled sailing canoe: 0")
    expect(page).to have_content("Keelboat: 0")
    expect(page).to have_content("Raft: 0")
    expect(page).to have_content("Single hulled sailing canoe: 0")
    expect(page).to have_content("Ballista: 0")
    expect(page).to have_content("Cabin: 0")
    expect(page).to have_content("Magical defenses: 0")
    expect(page).to have_content("Storage: 0")
  end
end
