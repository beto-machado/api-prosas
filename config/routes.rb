# frozen_string_literal: true

require "sidekiq/web"

Rails.application.routes.draw do
  namespace "api" do
    namespace "v1" do
      resources :propostas
    end
  end

  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    Rack::Utils.secure_compare(
      ::Digest::SHA256.hexdigest(username), Rails.configuration.x.sidekiq_user
    ) &
      Rack::Utils.secure_compare(
        ::Digest::SHA256.hexdigest(password), Rails.configuration.x.sidekiq_pass
      )
  end
  mount Sidekiq::Web, at: "sidekiq"
end
