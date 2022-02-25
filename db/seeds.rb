Proposta.create!(
  (1..50).map do
    {
      nome: Faker::Commerce.unique.product_name,
      descricao: Faker::Lorem.paragraph_by_chars,
      valor: Faker::Commerce.price,
      inicio: Faker::Date.between(from: 2.days.ago, to: Date.today),
      fim: Faker::Date.between(from: 2.days.ago, to: Date.today)
    }
  end
)
