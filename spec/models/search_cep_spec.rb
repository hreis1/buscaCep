require 'rails_helper'

RSpec.describe SearchCep, type: :model do
  context '.call' do
    it 'quando o CEP é encontrado no banco de dados' do
      Address.create(cep: '01311000', address: 'Avenida Paulista', city: 'São Paulo', state: 'SP', ddd: '11', quantity_searched: 1)

      address = SearchCep.new('01311000').call

      expect(address).to eq(Address.last)
    end

    it 'quando o CEP é encontrado na API e criado no banco de dados' do
      expect(Address.count).to eq(0)

      address = SearchCep.new('01311000').call

      expect(address).to be_present
      expect(address.cep).to eq('01311000')
      expect(address.address).to eq('Avenida Paulista')
      expect(address.city).to eq('São Paulo')
      expect(address.state).to eq('SP')
      expect(address.ddd).to eq('11')
      expect(address.quantity_searched).to eq(1)
    end

    it 'quando o CEP não é encontrado' do
      address = SearchCep.new('00000000').call

      expect(address).to be_nil
    end
  end
end
