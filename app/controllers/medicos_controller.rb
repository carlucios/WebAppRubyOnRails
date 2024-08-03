class MedicosController < ApplicationController
  before_action :set_medico, only: [ :show, :update, :destroy ]

  # GET /medicos
  def index
    @medicos = Medico.all
    render json: @medicos
  end

  # GET /medicos/:id
  def show
    render json: @medico
  end

  # POST /medicos
  def create
    @medico = Medico.new(medico_params)

    if @medico.save
      render json: @medico, status: :created, location: @medico
    else
      render json: @medico.errors, status: :unprocessable_entity
    end
  end

  # PATCH|PUT /medicos/:id
  def update
    if @medico.update(medico_params)
      render json: @medico
    else
      render json: @medico.errors, status: :unprocessable_entity
    end
  end

  # DELETE /medicos/:id
  def destroy
    @medico.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions
  def set_medico
    @medico = Medico.find_by(id: params[:id])
    unless @medico
      render json: { error: "Medico not found" }, status: :not_found
    end
  end

  # Only allow a trusted parameter white list through
  def medico_params
    params.require(:medico).permit(:email, :password, :name, :phone, :photo)
  end
end
