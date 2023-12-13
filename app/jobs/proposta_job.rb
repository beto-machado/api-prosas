# frozen_string_literal: true

class PropostaJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something
  end
end
