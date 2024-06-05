class CharactersController < ApplicationController
  def new
    @attrs = nil
    Rails.cache.instance_variable_get(:@data).keys.each do |key|
      @attrs = cached_attrs(key)
      break if @attrs 
    end
    @attrs ||= DndFacade.get_attrs
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

  private

  def cached_attrs(key)
    Rails.cache.fetch(key) if key.include?("attrs_list")
  end
end

