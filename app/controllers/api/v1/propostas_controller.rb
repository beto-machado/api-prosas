module Api
  module V1
    class PropostasController < ApplicationController
      include RenderMeta
      before_action :set_proposta, only: [:show, :update, :destroy]

      # GET /api/v1/propostas
      def index
        if search.present?
          @propostas = Proposta.search(search).sorted.page(params[:page])
        else
          @propostas = Proposta.sorted.page(params[:page])
        end

        render json: { type: :propostas, data: @propostas, meta: meta_attributes(@propostas) }
      end

      # GET /api/v1/propostas/1
      def show
        render json: { type: :proposta, data: @proposta}
      end

      # POST /api/v1/propostas
      def create
        @proposta = Proposta.new(proposta_params)

        if @proposta.save
          render json: { type: :proposta, data: @proposta.reload }, status: :created
        else
          render json: @proposta.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/propostas/1
      def update
        if @proposta.update(proposta_params)
          render json: { type: :proposta, data: @proposta}, status: :ok
        else
          render json: @proposta.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/propostas/1
      def destroy
        @propostas = Proposta.find(params[:id]).destroy
      end

      private
      def set_proposta
        @proposta = Proposta.find(params[:id])
      end

      def proposta_params
        params.require(:proposta).permit(:nome, :descricao, :valor, :inicio, :fim)
      end

      def search
        params[:search]
      end
    end
  end
end
