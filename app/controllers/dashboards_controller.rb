class DashboardsController < ApplicationController
  before_action :set_dashboard, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /dashboards
  # GET /dashboards.json
  def index
    @chat = 'http://www.twitch.tv/'+current_user.username+'/chat'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dashboard
      @dashboard = Dashboard.find(params[:id])
    end
end
