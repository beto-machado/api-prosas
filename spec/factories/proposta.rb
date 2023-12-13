# frozen_string_literal: true

FactoryBot.define do
  factory :proposta do
    nome { Faker::Name.unique.name }
    descricao { Faker::Lorem.paragraph_by_chars }
    valor { Faker::Commerce.price }
    inicio { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    fim { Faker::Date.between(from: 10.days.ago, to: Date.today) }
  end
end
