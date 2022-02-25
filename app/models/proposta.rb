class Proposta < ApplicationRecord

  with_options presence: true do
    validates :nome, uniqueness: true
    validates :descricao
    validates :valor
    validates :inicio
    validates :fim
  end

  validates :descricao, length: { maximum: 1000 }
  validates :valor, numericality: { :greater_than }

end
