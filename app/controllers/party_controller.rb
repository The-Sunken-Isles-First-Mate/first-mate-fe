class PartyController < ApplicationController
  def index
    @characters = BackendFacade.get_campaign_characters(params[:campaign_id])
  end
end