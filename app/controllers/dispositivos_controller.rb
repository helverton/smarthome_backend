class DispositivosController < ApplicationController
  before_action :set_dispositivo, only: [:show, :edit, :update, :destroy]

  # GET /dispositivos
  def index
    @dispositivos = Dispositivo.order(:nome)
    render json: @dispositivos
  end

  def logs
    @dispositivo = Dispositivo.find(params[:dispositivo_id])
    render :json => @dispositivo.to_json(
        :include => [ 
          :logs
        ]
    )
  end

  # GET /dispositivos/1
  def show
    render :json => @dispositivo.to_json(
        :include => [ 
          :logs
        ]
    )
  end

  # GET /dispositivos/new
  def new
    @dispositivo = Dispositivo.new
  end

  # GET /dispositivos/1/edit
  def edit
  end

  # POST /dispositivos
  def create
    @dispositivo = Dispositivo.new(dispositivo_params)
    @dispositivo.situacao = 0
    if @dispositivo.save
      render json: @dispositivo
    end      
  end

  def power
    @dispositivo = Dispositivo.find(params[:dispositivo_id])
    if (@dispositivo.situacao.eql? 0)
      @dispositivo.situacao = 1
    else
      @dispositivo.situacao = 0
    end

    @log = Log.new()
    @log.dispositivo_id = @dispositivo.id
    @log.situacao = @dispositivo.situacao
    @log.save
    @dispositivo.save
    render json: @dispositivo
  end

  # PATCH/PUT /dispositivos/1
  def update
    @dispositivo.update(dispositivo_params)
    @log = Log.new()
    @log.dispositivo_id = @dispositivo.id
    @log.situacao = @dispositivo.situacao
    @log.save
    render json: @dispositivo
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dispositivo
      @dispositivo = Dispositivo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dispositivo_params
      params.require(:dispositivo).permit(:nome, :descricao, :tipo, :situacao)
    end
end
