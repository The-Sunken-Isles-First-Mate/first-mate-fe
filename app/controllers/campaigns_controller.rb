class CampaignsController < ApplicationController
  def new
  end

  def create
    @dm = User.find(session[:user_id])
    @dm.role = 1

    redirect_to "/"
  end
end