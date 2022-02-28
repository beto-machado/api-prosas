require 'rails_helper'

RSpec.describe Proposta, type: :model do
  describe 'validations' do
    subject { create(:proposta) }

    it { should validate_presence_of(:nome) }
    it { should validate_presence_of(:descricao) }
    it { should validate_presence_of(:valor) }
    it { should validate_presence_of(:inicio) }
    it { should validate_presence_of(:fim) }

    it { should validate_uniqueness_of(:nome) }
    it { should validate_numericality_of(:valor).is_greater_than(0) }

  end
end
