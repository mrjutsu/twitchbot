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

    # Never trust parameters from the scary internet, only allow the white list through.
    def dashboard_params
      params.require(:dashboard).permit(:user_id)
    end
end
