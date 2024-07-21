# frozen_string_literal: true

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
end
