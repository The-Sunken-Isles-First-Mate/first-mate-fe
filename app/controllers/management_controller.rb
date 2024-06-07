class ManagementController < ApplicationController
  def edit
    @campaign = BackendFacade.get_campaign(params[:campaign_id])
    @management_form = BackendFacade.get_management_form(@campaign.id, @campaign.week)
    @all_items = BackendFacade.get_all_items.sort
  end

  def update
    campaign = BackendFacade.get_campaign(params[:campaign_id])
    management_form = BackendFacade.get_management_form(campaign.id, campaign.week)

    items_array = [params[:item_1], params[:item_2], params[:item_3], params[:item_4]]
      .map { |name| name.gsub(/[^a-zA-Z\s]/, '').downcase.gsub(/\s+/, '_') }

    form_data = {
      animal_products: params[:animal_products],
      cloth: params[:cloth],
      farmed_goods: params[:farmed_goods],
      food: params[:food],
      foraged_goods: params[:foraged_goods],
      metal: params[:metal],
      monster_parts: params[:monster_parts],
      stone: params[:stone],
      wood: params[:wood],
      items_array[0] => params[:item_1_quantity], # If the data is duplicated, it will only count
      items_array[1] => params[:item_2_quantity], # once for some reason. Could be useful to explore
      items_array[2] => params[:item_3_quantity], # some possible refactoring after
      items_array[3] => params[:item_4_quantity]
    }

    updated_form = BackendFacade.patch_management_form(management_form.id, form_data)

    if updated_form.keys.first == :errors
      flash[:error] = updated_form[:errors][0][:title]
    else
      flash[:success] = "Form successfully updated."
    end

    redirect_to campaign_management_path
  end

  def advance_week
    @campaign = BackendFacade.get_campaign(params[:campaign_id])
    @management_form = BackendFacade.get_management_form(@campaign.id, @campaign.week)
    new_week = BackendFacade.post_advance_week(@campaign.id, @management_form)

    redirect_to campaign_management_path
  end
end