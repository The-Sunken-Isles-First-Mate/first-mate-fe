require 'rails_helper'

RSpec.describe "Characters New Page", type: :feature do
  xit "is a form to create a new character" do
    visit new_character_path
    save_and_open_page
    expect(current_path).to eq(new_character_path)

    within ".character_form" do
      expect(page).to have_content("Character Name")
      expect(page).to have_field (:name)
      expect(page).to have_button("Create Character")
    end
  end
end