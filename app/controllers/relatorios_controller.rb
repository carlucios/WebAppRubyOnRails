class RelatoriosController < ApplicationController
  before_action :set_relatorio, only: [:show, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  # GET /relatorios
  def index
    @relatorios = Relatorio.all
    render json: @relatorios
  end

  # GET /relatorios/:id
  def show
    render json: @relatorio
  end

  # POST /relatorios
  def create
    @relatorio = Relatorio.new(relatorio_params)

    if @relatorio.save
      render json: @relatorio, status: :created, location: @relatorio
    else
      render json: @relatorio.errors, status: :unprocessable_entity
    end
  end

  # PATCH|PUT /relatorios/:id
  def update
    if @relatorio.update(relatorio_params)
      render json: @relatorio
    else
      render json: @relatorio.errors, status: :unprocessable_entity
    end
  end

  # DELETE /relatorios/:id
  def destroy
    @relatorio.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions
  def set_relatorio
    @relatorio = Relatorio.find(params[:id])
  end

  # Only allow a trusted parameter white list through
  def relatorio_params
    params.require(:relatorio).permit(:sessao_id, :description, :photo)
  end

  # Returns error if resource does not exist
  def record_not_found
    render json: { error: "Recurso não encontrado" }, status: :not_found
  end
end