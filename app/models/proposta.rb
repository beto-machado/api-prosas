class Proposta < ApplicationRecord
  include PgSearch::Model

  with_options presence: true do
    validates :nome, uniqueness: true
    validates :descricao
    validates :valor
    validates :inicio
    validates :fim
  end

  validates :descricao, length: { maximum: 1000 }
  validates :valor, numericality: { greater_than: 0 }

  pg_search_scope :search,
                  against: [
                    [:nome, 'A'],
                    [:inicio, 'A'],
                    [:fim, 'A'],
                    [:valor, 'A']
                  ]

  scope :sorted, ->{ order(nome: :asc) }

end
