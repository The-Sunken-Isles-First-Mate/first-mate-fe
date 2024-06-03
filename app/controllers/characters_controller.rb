class CharactersController < ApplicationController
  def new
    @classes = DndFacade.classes.map  { |race| race.name }
    @races = DndFacade.races.map { |race| race.name }
  end

  def create
    data = {
      url: "api/v1/characters",
      name: params[:name],
      dnd_race: params[:race],
      dnd_class: params[:class],
      user_id: session[:user_id]
    }

    BackendFacade.create_character(data)

    # Temp redirect back to dashboard - will go to the summary page
    redirect_to "/dashboard"
  end
end