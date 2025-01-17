require 'rails_helper'

RSpec.describe 'Home', type: :system do
  it 'visita a página inicial' do
    visit root_path

    expect(page).to have_text('Busca por CEP')
  end

  it 'busca por CEP ao preencher o campo' do
    visit root_path

    fill_in 'cep', with: '05424020'

    expect(page).to have_text('Rua Professor Carlos Reis')
    expect(page).to have_text('São Paulo')
    expect(page).to have_text('SP')
    expect(page).to have_text('DDD 11')
  end

  it 'exibe mensagem de erro para CEP não encontrado' do
    visit root_path

    fill_in 'cep', with: '99999999'

    expect(page).to have_text('CEP não encontrado')
  end

  it 'mostra ceps mais buscados' do
    Address.create(cep: '01001000', address: 'Praça da Sé', city: 'São Paulo', state: 'SP', ddd: '11',
                   quantity_searched: 2)
    Address.create(cep: '30190110', address: 'Avenida do Contorno', city: 'Belo Horizonte', state: 'MG', ddd: '31',
                   quantity_searched: 3)
    Address.create(cep: '70002900', address: 'Esplanada dos Ministérios', city: 'Brasília', state: 'DF', ddd: '61',
                   quantity_searched: 4)

    visit root_path

    expect(page).to have_text('CEPs mais buscados')
    expect(page.body.index('DF 70002900')).to be < page.body.index('MG 30190110')
    expect(page.body.index('MG 30190110')).to be < page.body.index('SP 01001000')
  end

  it 'mostra ceps mais buscados por estado' do
    Address.create(cep: '01001000', address: 'Praça da Sé', city: 'São Paulo', state: 'SP', ddd: '11',
                   quantity_searched: 2)
    Address.create(cep: '30190110', address: 'Avenida do Contorno', city: 'Belo Horizonte', state: 'MG', ddd: '31',
                   quantity_searched: 3)
    Address.create(cep: '70002900', address: 'Esplanada dos Ministérios', city: 'Brasília', state: 'DF', ddd: '61',
                   quantity_searched: 4)

    Address.create(cep: '05424020', address: 'Rua Professor Carlos Reis', city: 'São Paulo', state: 'SP', ddd: '11',
                   quantity_searched: 1)

    visit root_path

    expect(page).to have_text('CEPs mais buscados por estado')
    expect(page.body.index('DF 70002900')).to be < page.body.index('MG 30190110')
    expect(page.body.index('MG 30190110')).to be < page.body.index('SP 01001000')
    expect(page).not_to have_text('SP 05424020')
  end

  it 'mostra quantidade de endereços buscados por estado' do
    Address.create(cep: '01001000', address: 'Praça da Sé', city: 'São Paulo', state: 'SP', ddd: '11',
                   quantity_searched: 2)
    Address.create(cep: '30190110', address: 'Avenida do Contorno', city: 'Belo Horizonte', state: 'MG', ddd: '31',
                   quantity_searched: 3)
    Address.create(cep: '70002900', address: 'Esplanada dos Ministérios', city: 'Brasília', state: 'DF', ddd: '61',
                   quantity_searched: 4)

    visit root_path

    expect(page).to have_text('Quantidade de CEPs buscados por estado')
    expect(page).to have_text('SP 1')
    expect(page).to have_text('MG 1')
    expect(page).to have_text('DF 1')
  end

  it 'não mostra quando não há registros' do
    visit root_path

    expect(page).not_to have_text('CEPs mais buscados')
    expect(page).not_to have_text('CEPs mais buscados por estado')
    expect(page).not_to have_text('Quantidade de CEPs buscados por estado')
  end
end
