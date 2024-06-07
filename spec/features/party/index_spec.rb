require 'rails_helper'

RSpec.describe "Party Index Page", type: :feature do
  it 'has all information', :vcr do
    visit campaign_party_path(1)

    expect(page).to have_content('Party')

    expect(page).to have_content('Test Character 1')
    expect(page).to have_content('Race: Dragonborn')
    expect(page).to have_content('Class: Barbarian')
    
    expect(page).to have_content('Test Character 2')
    expect(page).to have_content('Race: Human')
    expect(page).to have_content('Class: Bard')
  end
end