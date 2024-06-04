class CampaignsController < ApplicationController
  def new
  end

  def create
    #current_user
    data = {
      url: "/api/v1/campaigns",
      name: params[:name],
      player_1: params[:player_1],
      player_2: params[:player_2],
      player_3: params[:player_3],
      player_4: params[:player_4]
    }

    new_campaign = BackendFacade.create_campaign(data) # Create the Campaign

    campaign = DndCampaign.new({
      id: new_campaign[:data][:id],
      name: new_campaign[:data][:attributes][:name],
      week: new_campaign[:data][:attributes][:week], 
      animal_products: new_campaign[:data][:attributes][:animal_products],
      cloth: new_campaign[:data][:attributes][:cloth],
      farmed_goods: new_campaign[:data][:attributes][:farmed_goods],
      food: new_campaign[:data][:attributes][:food],
      foraged_goods: new_campaign[:data][:attributes][:foraged_goods],
      metal: new_campaign[:data][:attributes][:metal],
      monster_parts: new_campaign[:data][:attributes][:monster_parts],
      stone: new_campaign[:data][:attributes][:stone],
      wood: new_campaign[:data][:attributes][:wood],
      villagers: new_campaign[:data][:attributes][:villagers]
    })

    # Create the UserCampaign for the DM
    dm_conn = BackendFacade.create_user_campaign_dm(campaign.id, current_user)
    
    # Create the UserCampaign for all players
    binding.pry

    # Temp redirect back to dashboard - will go to the summary page
    redirect_to "/dashboard"
  end
end