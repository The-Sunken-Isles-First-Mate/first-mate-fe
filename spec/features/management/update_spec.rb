require 'rails_helper'

RSpec.describe "Resource management form", type: :feature do # This will need to be edited
  xit "is a form to update a resource management form", :vcr do
    visit campaign_management_path

    expect(current_path).to eq(campaign_management_path)

    within ".resource_management_form" do
      expect(page).to have_content("Week 0")
      expect(page).to have_content("Resources Available")

      within ".crafting_materials" do
        expect(page).to have_content("Crafting Materials")

        expect(page).to have_content("Wood: 0")
        expect(page).to have_content("Stone: 0")
        expect(page).to have_content("Metal: 0")
        expect(page).to have_content("Cloth: 0")
        expect(page).to have_content("Animal Products: 0")
        expect(page).to have_content("Monster Parts: 0")
      end

      within ".management_form" do
        expect(page).to have_content("Assign Villagers - #{Campaign.villagers.count} Available")
        expect(page).to have_content("Food: 0")
        expect(page).to have_content("Farmed Goods: 0")
        expect(page).to have_content("Foraged Goods: 0")
        expect(page).to have_content("Wood: 0")
        expect(page).to have_content("Stone: 0")
        expect(page).to have_content("Metal: 0")
        expect(page).to have_content("Cloth: 0")
        expect(page).to have_content("Animal Products: 0")
        expect(page).to have_content("Monster Parts: 0")
      end

      within ".crafting_items" do
        expect(page).to have_select("Item1", with_options: [
          "Animal Products", "Cloth", "Farmed Goods", "Food", "Foraged Goods", "Metal",
          "Stone", "Wood", "Monster Parts", "Light Armor", "Medium Armor", "Heavy Armor",
          "Simple Weapon", "Martial Weapon", "Ammunition", "Adventuring Supplies", "Assassin Blood",
          "Malice", "Midnight Tears", "Serpent Venom", "Truth Serum", "Oil of Slipperiness",
          "Potion of Climbing", "Potion of Healing", "Potion of Water Breathing", "Barge",
          "Coracle", "Double Hulled Sailing Canoe", "Single Hulled Sailing Canoe", "Raft",
          "Ballista", "Cabin", "Magical Defense", "Storage"
        ])

        expect(page).to have_select("Item2", with_options: [
          "Animal Products", "Cloth", "Farmed Goods", "Food", "Foraged Goods", "Metal",
          "Stone", "Wood", "Monster Parts", "Light Armor", "Medium Armor", "Heavy Armor",
          "Simple Weapon", "Martial Weapon", "Ammunition", "Adventuring Supplies", "Assassin Blood",
          "Malice", "Midnight Tears", "Serpent Venom", "Truth Serum", "Oil of Slipperiness",
          "Potion of Climbing", "Potion of Healing", "Potion of Water Breathing", "Barge",
          "Coracle", "Double Hulled Sailing Canoe", "Single Hulled Sailing Canoe", "Raft",
          "Ballista", "Cabin", "Magical Defense", "Storage"
        ])

        expect(page).to have_select("Item3", with_options: [
          "Animal Products", "Cloth", "Farmed Goods", "Food", "Foraged Goods", "Metal",
          "Stone", "Wood", "Monster Parts", "Light Armor", "Medium Armor", "Heavy Armor",
          "Simple Weapon", "Martial Weapon", "Ammunition", "Adventuring Supplies", "Assassin Blood",
          "Malice", "Midnight Tears", "Serpent Venom", "Truth Serum", "Oil of Slipperiness",
          "Potion of Climbing", "Potion of Healing", "Potion of Water Breathing", "Barge",
          "Coracle", "Double Hulled Sailing Canoe", "Single Hulled Sailing Canoe", "Raft",
          "Ballista", "Cabin", "Magical Defense", "Storage"
        ])
      end
    end
  end
end
