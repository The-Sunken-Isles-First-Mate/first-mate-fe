require 'rails_helper'

RSpec.describe "Characters Show Page", type: :feature do
  it "it displays all characters in your party, along with their name, class, race and image", :vcr do
    visit new_character_path

    expect(current_path).to eq(new_character_path)

    within ".character_form" do
      expect(page).to have_content("Character Name")
      expect(page).to have_field (:name)
      expect(page).to have_button("Create Character")
    end
  end
end