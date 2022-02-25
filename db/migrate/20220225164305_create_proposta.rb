class CreateProposta < ActiveRecord::Migration[6.1]
  def change
    create_table :proposta, id: :uuid do |t|
      t.string :nome, null: false
      t.string :descricao, null: false
      t.float :valor, null: false, default: 0.0, precision: 5, scale: 2
      t.date :inicio, null: false
      t.date :fim, null: false

      t.timestamps
    end
  end
end
