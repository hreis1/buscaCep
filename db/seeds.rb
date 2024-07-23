# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

addresses = [
  { cep: '01001000', address: 'Praça da Sé', city: 'São Paulo', state: 'SP', ddd: '11', quantity_searched: 101 },
  { cep: '01002000', address: 'Rua Direita', city: 'São Paulo', state: 'SP', ddd: '11', quantity_searched: 102 },
  { cep: '01003000', address: 'Rua José Bonifácio', city: 'São Paulo', state: 'SP', ddd: '11', quantity_searched: 103 },
  { cep: '05407002', address: 'Rua Cardeal Arcoverde', city: 'Rio de Janeiro', state: 'RJ', ddd: '21', quantity_searched: 104 },
  { cep: '12302022', address: 'Rua Rio Grande do Sul', city: 'Rio de Janeiro', state: 'RJ', ddd: '21',
  quantity_searched: 105 },
  { cep: '20010020', address: 'Rua São José', city: 'Rio de Janeiro', state: 'RJ', ddd: '21', quantity_searched: 106 },
  { cep: '69005000', address: 'Rua Marechal Deodoro', city: 'Manaus', state: 'AM', ddd: '92', quantity_searched: 107 },
  { cep: '69010000', address: 'Avenida Eduardo Ribeiro', city: 'Manaus', state: 'AM', ddd: '92', quantity_searched: 108 },
  { cep: '69020000', address: 'Avenida Tarumã', city: 'Manaus', state: 'AM', ddd: '92', quantity_searched: 109 }
]

addresses.each do |address|
  Address.create!(address)
end
