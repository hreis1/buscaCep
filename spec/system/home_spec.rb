# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home', type: :system do
  it 'shows the home page' do
    visit root_path

    expect(page).to have_text('Busca por CEP')
  end
end
