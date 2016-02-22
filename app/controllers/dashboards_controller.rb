class DashboardsController < ApplicationController
  before_action :set_dashboard, only: [:show, :edit, :update, :destroy]

  # GET /dashboards
  # GET /dashboards.json
  def index
    @dashboards = Dashboard.all

    client_id='jpkchasuwimpy25zlzgx6q0ve6kc75h'
    state='6xqr72504rbfpwmbxuou9n7lytgaon2'
    url="https://api.twitch.tv/kraken/oauth2/authorize?response_type=code&client_id=#{client_id}&redirect_uri=localhost:3000&scope=user_read&state=#{state}"
    @twitch = Twitch.new({
      client_id: client_id,
      secret_key: state,
      redirect_uri: "http://localhost:3000",
      scope: ["user_read"]
    })

    @data = @twitch.auth(params[:code])
    puts @data.inspect
    session[:access_token] = @data[:body]["access_token"]
    puts "++++++++++++++++++++++"
    puts session[:access_token].inspect
  end

  # GET /dashboards/1
  # GET /dashboards/1.json
  def show
  end

  # GET /dashboards/new
  def new
    @dashboard = Dashboard.new
  end

  # GET /dashboards/1/edit
  def edit
  end

  # POST /dashboards
  # POST /dashboards.json
  def create
    @dashboard = Dashboard.new(dashboard_params)

    respond_to do |format|
      if @dashboard.save
        format.html { redirect_to @dashboard, notice: 'Dashboard was successfully created.' }
        format.json { render :show, status: :created, location: @dashboard }
      else
        format.html { render :new }
        format.json { render json: @dashboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dashboards/1
  # PATCH/PUT /dashboards/1.json
  def update
    respond_to do |format|
      if @dashboard.update(dashboard_params)
        format.html { redirect_to @dashboard, notice: 'Dashboard was successfully updated.' }
        format.json { render :show, status: :ok, location: @dashboard }
      else
        format.html { render :edit }
        format.json { render json: @dashboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboards/1
  # DELETE /dashboards/1.json
  def destroy
    @dashboard.destroy
    respond_to do |format|
      format.html { redirect_to dashboards_url, notice: 'Dashboard was successfully destroyed.' }
      format.json { head :no_content }
    end
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