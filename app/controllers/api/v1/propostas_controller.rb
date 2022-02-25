module Api

  module V1

    class PropostasController < ApplicationController
      before_action :set_proposta, only: [:show, :update, :destroy]

      # GET /api/v1/proposta
      def index
        @propostas = Proposta.all

        render json: { type: :propostas, data: @propostas, count: @propostas.length}
      end

      # GET /api/v1/propostas/1
      def show
        render json: { type: :proposta, data: @proposta}
      end

      # POST /api/v1/propostas
      def create
        @proposta = Proposta.new(proposta_params)

        if @proposta.save
          render json: { type: :proposta, data: @proposta}, status: :created
        else
          render json: @proposta.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/propostas/1
      def update
        if @proposta.update(proposta_params)
          render json: { type: :proposta, data: @proposta}
        else
          render json: @proposta.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/propostas/1
      def destroy
        @proposta.destroy
      end

      private
      def set_proposta
        @proposta = Proposta.find(params[:id])
      end

      def proposta_params
        params.require(:proposta).permit(:nome, :descricao, :valor, :inicio, :fim)
      end
    end
  end
end
