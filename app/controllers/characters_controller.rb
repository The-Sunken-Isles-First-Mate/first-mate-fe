class CharactersController < ApplicationController
  def new
    @classes = DndFacade.classes.map  { |race| race.name }
    @races = DndFacade.races.map { |race| race.name }
  end

  def create
    binding.pry
  end
end