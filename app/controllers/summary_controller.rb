class SummaryController < ApplicationController
  def show
    @campaign = BackendFacade.get_campaign(params[:campaign_id])
    @items = BackendFacade.get_campaign_items(params[:campaign_id])
    session[:campaign_id] = params[:campaign_id]
  end
end
