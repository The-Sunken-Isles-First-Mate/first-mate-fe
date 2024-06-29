class CharactersController < ApplicationController
  def new
    @user_campaign_id = params[:user_campaign_id]
  end

  def create
    character = BackendFacade.create_character({
      data: {
      name: params[:name],
      dnd_race: params[:race],
      dnd_class: params[:class],
      user_id: current_user.id},
      character_image: {
      image: params[:character_image]
  }
    })

    BackendFacade.update_user_campaign({
      user_campaign_id: params[:user_campaign_id],
      character_id: character.id
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
