class SessaosController < ApplicationController
  before_action :set_sessao, only: [:show, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  # GET /sessaos
  def index
    @sessaos = Sessao.all
    render json: @sessaos
  end

  # GET /sessaos/:id
  def show
    render json: @sessao
  end

  # POST /sessaos
  def create
    @sessao = Sessao.new(sessao_params)

    if @sessao.save
      render json: @sessao, status: :created, location: @sessao
    else
      render json: @sessao.errors, status: :unprocessable_entity
    end
  end

  # PATCH|PUT /sessaos/:id
  def update
    if @sessao.update(sessao_params)
      render json: @sessao
    else
      render json: @sessao.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sessaos/:id
  def destroy
    @sessao.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions
  def set_sessao
    @sessao = Sessao.find(params[:id])
  end

  # Only allow a trusted parameter white list through
  def sessao_params
    params.require(:sessao).permit(:medico_id, :paciente_id, :start_date, :start_hour, :end_hour)
  end

  # Returns error if resource does not exist
  def record_not_found
    render json: { error: "Recurso não encontrado" }, status: :not_found
  end
end
