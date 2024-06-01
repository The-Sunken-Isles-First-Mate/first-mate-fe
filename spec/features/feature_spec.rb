require 'rails_helper'

RSpec.describe "Welcome Index Page", type: :feature do
  it "has button to sign into GitHub" do
    visit root_path

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome to The Sunken Isles First Mate Application!")
    expect(page).to have_link("Sign in with GitHub")
  end

  it "redirects to GitHub OAuth after clicking on the GitHub link" do
    visit root_path

    click_on("Sign in with GitHub")

    expect(current_path).to eq("/login/oauth/authorize")
  end
end