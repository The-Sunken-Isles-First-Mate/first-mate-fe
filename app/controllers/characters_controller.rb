class CharactersController < ApplicationController
  def new
    @user_campaign_id = params[:user_campaign_id]
    @classes = DndFacade.classes.map  { |race| race.name }
    @races = DndFacade.races.map { |race| race.name }
  end

  def create
    character = BackendFacade.create_character({
      name: params[:name],
      dnd_race: params[:race],
      dnd_class: params[:class],
      user_id: current_user.id
    })

    BackendFacade.update_user_campaign({
      user_campaign_id: params[:user_campaign_id],
      character_id: character.id
    })

    # Commented out because we need to figure out how the campaign and character are linked
    # redirect_to summary_path(campaign.id)

    redirect_to dashboard_path
  end
end
