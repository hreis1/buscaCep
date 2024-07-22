require 'rails_helper'

RSpec.describe Address, type: :model do
  context 'most_searched' do
    it 'retorna os 3 endereços mais buscados' do
      address1 = Address.create(cep: '12345678', address: 'Rua A', city: 'São Paulo', state: 'SP', ddd: '11', quantity_searched: 3)
      address2 = Address.create(cep: '12345679', address: 'Rua B', city: 'São Paulo', state: 'SP', ddd: '11', quantity_searched: 1)
      address3 = Address.create(cep: '12345680', address: 'Rua C', city: 'São Paulo', state: 'SP', ddd: '11', quantity_searched: 2)
      address4 = Address.create(cep: '12345681', address: 'Rua D', city: 'São Paulo', state: 'SP', ddd: '11', quantity_searched: 0)

      most_searched = described_class.most_searched

      expect(most_searched).to eq([address1, address3, address2])
    end
  end
end