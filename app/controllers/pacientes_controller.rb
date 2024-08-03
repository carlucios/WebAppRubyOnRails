class PacientesController < ApplicationController
  before_action :set_paciente, only: [:show, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  # GET /pacientes
  def index
    @pacientes = Paciente.all
    render json: @pacientes
  end

  # GET /pacientes/:id
  def show
    render json: @paciente
  end

  # POST /pacientes
  def create
    @paciente = Paciente.new(paciente_params)

    if @paciente.save
      render json: @paciente, status: :created, location: @paciente
    else
      render json: @paciente.errors, status: :unprocessable_entity
    end
  end

  # PATCH|PUT /pacientes/:id
  def update
    if @paciente.update(paciente_params)
      render json: @paciente
    else
      render json: @paciente.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pacientes/:id
  def destroy
    @paciente.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions
  def set_paciente
    @paciente = Paciente.find(params[:id])
  end

  # Only allow a trusted parameter white list through
  def paciente_params
    params.require(:paciente).permit(:medico_id, :pf, :name, :photo ,:address ,:phone ,:insurance ,:hd ,:email, :birth_date, :val_date, :proc_date, :rg, :dominance)
  end

  # Returns error if resource does not exist
  def record_not_found
    render json: { error: "Recurso não encontrado" }, status: :not_found
  end
end
