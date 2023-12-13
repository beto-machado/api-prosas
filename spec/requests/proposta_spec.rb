# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/api/v1/propostas", type: :request do
  let(:proposta_params) do
    { nome: "Luis Roberto", descricao: "Primeira Proposta", valor: 80.80,
      inicio: "10/12/2021", fim: "10/02/2022" }
  end

  describe "GET /index" do
    it "return list of proposal" do
      create_list(:proposta, 3)

      get "/api/v1/propostas"
      expect(response).to have_http_status 200
      expect(json_body[:data]).to be_an_instance_of Array
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe "GET /show" do
    it "return a proposal" do
      proposta = create(:proposta)

      get "/api/v1/propostas/#{proposta.id}"

      expect(response).to have_http_status 200
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creating a new Proposal" do
        proposta_count = Proposta.count

        post "/api/v1/propostas/", params: { proposta: proposta_params }

        expect(response).to have_http_status 201

        expect(Proposta.count) == (proposta_count + 1)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Proposta with the same name" do
        post "/api/v1/propostas/", params: { proposta: proposta_params }

        expect(response).to have_http_status 422
      end
    end
  end

  describe "PATCH /update" do
    it "update a proposal" do
      proposta = create(:proposta)

      proposta_params_1 = { nome: "Luis Roberto", descricao: "Primeira Proposta", valor: 80.80 }

      put "/api/v1/propostas/#{proposta.id}", params: { proposta: proposta_params_1 }

      expect(response).to have_http_status 200

      proposta_id = json_body[:data][:id]
      proposta = Proposta.find(proposta_id)
      expect(proposta.nome).to eq("Luis Roberto")
      expect(proposta.descricao).to eq("Primeira Proposta")
      expect(proposta.valor).to eq(80.80)
    end
  end

  describe "DELETE /destroy" do
    it "deleting the proposal" do
      proposta = create(:proposta)
      proposta_count = Proposta.count

      delete "/api/v1/propostas/#{proposta.id}"

      expect(response).to have_http_status 204
      expect(Proposta.count).to eq(proposta_count - 1)
    end
  end
end
