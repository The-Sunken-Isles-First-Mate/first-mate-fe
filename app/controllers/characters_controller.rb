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
    character = BackendFacade.create_character({
      name: params[:name],
      dnd_race: params[:race],
      dnd_class: params[:class],
      user_id: current_user.id
    })

    # Commented out because we need to figure out how the campaign and character are linked
    # redirect_to summary_path(campaign.id)

    redirect_to dashboard_path
  end

  private

  def cached_attrs(key)
    Rails.cache.fetch(key) if key.include?("attrs_list")
  end
end

