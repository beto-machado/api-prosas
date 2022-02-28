class Proposta < ApplicationRecord
  include PgSearch::Model

  with_options presence: true do
    validates :nome, uniqueness: true
    validates :descricao
    validates :valor
    validates :inicio
    validates :fim
  end

  validates :descricao, length: { maximum: 2000 }
  validates :valor, numericality: { greater_than: 0 }

  pg_search_scope :search,
                  against: [
                    [:nome, 'A'],
                    [:inicio, 'A'],
                    [:fim, 'A'],
                    [:valor, 'A']
                  ]

  scope :sorted, ->{ order(nome: :asc) }

  def start_at
    self.inicio.strftime("%d/%m/%Y")
  end

  def finish_at
    attributes['fim'].strftime("%d/%m/%Y")
  end

end
