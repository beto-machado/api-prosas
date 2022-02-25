class PropostaController < ApplicationController
  before_action :set_propostum, only: [:show, :update, :destroy]

  # GET /proposta
  def index
    @proposta = Propostum.all

    render json: @proposta
  end

  # GET /proposta/1
  def show
    render json: @propostum
  end

  # POST /proposta
  def create
    @propostum = Propostum.new(propostum_params)

    if @propostum.save
      render json: @propostum, status: :created, location: @propostum
    else
      render json: @propostum.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /proposta/1
  def update
    if @propostum.update(propostum_params)
      render json: @propostum
    else
      render json: @propostum.errors, status: :unprocessable_entity
    end
  end

  # DELETE /proposta/1
  def destroy
    @propostum.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_propostum
      @propostum = Propostum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def propostum_params
      params.require(:propostum).permit(:nome, :descricao, :valor, :inicio, :fim)
    end
end
