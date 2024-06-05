class ManagementController < ApplicationController
  def edit
    @campaign = BackendFacade.get_campaign(params[:campaign_id])
    @management_form = BackendFacade.get_management_form(@campaign.id, @campaign.week)

    # Display the current management form
    # Update button will update the form
    
    # Update Management Form - send to update action in controller
    # Advance Time Button - send to some action in controller
  end

  def update
    #binding.pry
    # Yay! Hitting the update button hits the pry
  end

  def advance_week
    # binding.pry
    # Yay! Hitting the update button hits the pry

    # Build out the functionality for advancing a week
    # Facade
    # Service
    # Poro
    # Back here to Controller
  end
end