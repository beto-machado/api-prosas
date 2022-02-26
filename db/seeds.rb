Proposta.create!(
  (1..50).map do
    {
      nome: Faker::Name.unique.name,
      descricao: Faker::Lorem.paragraph_by_chars,
      valor: Faker::Commerce.price,
      inicio: Faker::Date.between(from: 10.days.ago, to: Date.today),
      fim: Faker::Date.between(from: 0.days.ago, to: Date.today)
    }
  end
)
