class CharactersController < ApplicationController
  def new
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

    redirect_to summary_path(campaign.id)
  end
end