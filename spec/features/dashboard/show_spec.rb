require 'rails_helper'

RSpec.describe "Dashboard Show Page", type: :feature do
  xit "has a welcome message for the user" do
    visit dashboard_path
    #save_and_open_page
  end

  xit "has a button for creating a campaign" do
    visit dashboard_path
    #save_and_open_page
  end

  xit "has a button for creating a character" do
    visit dashboard_path
    #save_and_open_page
  end

  xit "user cannot access the dashboard unless logged in" do
    visit dashboard_path
    #save_and_open_page
  end
end