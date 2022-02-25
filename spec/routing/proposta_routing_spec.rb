require "rails_helper"

RSpec.describe PropostaController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/proposta").to route_to("proposta#index")
    end

    it "routes to #show" do
      expect(get: "/proposta/1").to route_to("proposta#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/proposta").to route_to("proposta#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/proposta/1").to route_to("proposta#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/proposta/1").to route_to("proposta#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/proposta/1").to route_to("proposta#destroy", id: "1")
    end
  end
end
