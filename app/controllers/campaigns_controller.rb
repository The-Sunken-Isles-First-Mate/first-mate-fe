class CampaignsController < ApplicationController
  def new
  end

  def create
    main_user = User.new(session[:user])
    campaign = BackendFacade.create_campaign(params[:name])
    dm = BackendFacade.create_user_campaign_dm(campaign.id, main_user)
    players = [params[:player_1], params[:player_2], params[:player_3], params[:player_4]]
    players.each do |player|
      if !player.empty?
        pl = BackendFacade.create_user_campaign_pl(campaign.id, player)
      end
    end

    redirect_to dashboard_path
  end
end