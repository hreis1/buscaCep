require 'rails_helper'

RSpec.describe Address, type: :model do
  context 'most_searched' do
    it 'retorna os 3 endereços mais buscados' do
      address1 = Address.create(cep: '12345678', address: 'Rua A', city: 'São Paulo', state: 'SP', ddd: '11',
                                quantity_searched: 3)
      address2 = Address.create(cep: '12345679', address: 'Rua B', city: 'São Paulo', state: 'SP', ddd: '11',
                                quantity_searched: 1)
      address3 = Address.create(cep: '12345680', address: 'Rua C', city: 'São Paulo', state: 'SP', ddd: '11',
                                quantity_searched: 2)
      Address.create(cep: '12345681', address: 'Rua D', city: 'São Paulo', state: 'SP', ddd: '11',
                     quantity_searched: 0)

      most_searched = described_class.most_searched

      expect(most_searched).to eq([address1, address3, address2])
    end
  end

  context 'most_searched_by_state' do
    it 'retorna os 3 endereços mais buscados por estado' do
      address_sp = Address.create(cep: '12345678', address: 'Rua A', city: 'São Paulo', state: 'SP', ddd: '11',
                                  quantity_searched: 3)
      Address.create(cep: '12345679', address: 'Rua B', city: 'São Paulo', state: 'SP', ddd: '11',
                     quantity_searched: 1)
      address_mg = Address.create(cep: '12345680', address: 'Rua C', city: 'Belo Horizonte', state: 'MG', ddd: '31',
                                  quantity_searched: 2)
      Address.create(cep: '12345681', address: 'Rua D', city: 'Belo Horizonte', state: 'MG', ddd: '31',
                     quantity_searched: 1)
      address_ba = Address.create(cep: '12345682', address: 'Rua E', city: 'Salvador', state: 'BA', ddd: '71',
                                  quantity_searched: 4)
      Address.create(cep: '12345683', address: 'Rua F', city: 'Salvador', state: 'BA', ddd: '71',
                     quantity_searched: 1)

      most_searched_by_state = described_class.most_searched_by_state

      expect(most_searched_by_state).to eq([address_ba, address_sp, address_mg])
    end
  end

  context 'quantity_addresses_searched_by_state' do
    it 'retorna a quantidade de endereços buscados por estado' do
      Address.create(cep: '12345678', address: 'Rua A', city: 'São Paulo', state: 'SP', ddd: '11',
                     quantity_searched: 3)
      Address.create(cep: '12345679', address: 'Rua B', city: 'São Paulo', state: 'SP', ddd: '11',
                     quantity_searched: 1)
      Address.create(cep: '12345680', address: 'Rua C', city: 'São Paulo', state: 'SP', ddd: '11',
                     quantity_searched: 2)
      Address.create(cep: '12345681', address: 'Rua D', city: 'Belo Horizonte', state: 'MG', ddd: '31',
                     quantity_searched: 2)
      Address.create(cep: '12345682', address: 'Rua E', city: 'Belo Horizonte', state: 'MG', ddd: '31',
                     quantity_searched: 1)
      Address.create(cep: '12345683', address: 'Rua F', city: 'Salvador', state: 'BA', ddd: '71',
                     quantity_searched: 4)

      quantity_searched_by_state = described_class.quantity_addresses_searched_by_state

      expect(quantity_searched_by_state).to eq({ 'SP' => 3, 'MG' => 2, 'BA' => 1 })
    end
  end
end
