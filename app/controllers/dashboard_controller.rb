class DashboardController < ApplicationController
  def show
    redirect_to root_path if current_user.nil?
  end
end