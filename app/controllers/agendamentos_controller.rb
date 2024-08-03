class AgendamentosController < ApplicationController
  before_action :set_agendamento, only: [:show, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  # GET /agendamentos
  def index
    @agendamentos = Agendamento.all
    render json: @agendamentos
  end

  # GET /agendamentos/:id
  def show
    render json: @agendamento
  end

  # POST /agendamentos
  def create
    @agendamento = Agendamento.new(agendamento_params)

    if @agendamento.save
      render json: @agendamento, status: :created, location: @agendamento
    else
      render json: @agendamento.errors, status: :unprocessable_entity
    end
  end

  # PATCH|PUT /agendamentos/:id
  def update
    if @agendamento.update(agendamento_params)
      render json: @agendamento
    else
      render json: @agendamento.errors, status: :unprocessable_entity
    end
  end

  # DELETE /agendamentos/:id
  def destroy
    @agendamento.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions
  def set_agendamento
    @agendamento = Agendamento.find(params[:id])
  end

  # Only allow a trusted parameter white list through
  def agendamento_params
    params.require(:agendamento).permit(:medico_id, :paciente_id, :start_date, :start_hour, :end_hour)
  end

  # Returns error if resource does not exist
  def record_not_found
    render json: { error: "Recurso não encontrado" }, status: :not_found
  end
end