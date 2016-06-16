class LogsController < ApplicationController
  before_action :set_log, only: [:show, :edit, :update, :destroy]

  # GET /logs
  def index
    @logs = Log.all
    render json: @logs
  end

  # GET /logs/1
  def show
    render json: @log
  end

  # GET /logs/new
  def new
    @log = Log.new
  end

  # GET /logs/1/edit
  def edit
  end

  # POST /logs
  def create
    @log = Log.new(log_params)

    if @log.save
      render json: @log
    end
  end

  # PATCH/PUT /logs/1
  def update
    @log.update(log_params)
    render json: @log
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def log_params
      params.require(:log).permit(:situacao, :dispositivo_id)
    end
end
