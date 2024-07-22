class HomeController < ApplicationController
  def index
    @addresses_most_searched = Address.most_searched
    @addresses_most_searched_by_state = Address.most_searched_by_state
    @quantity_addresses_searched_by_state = Address.quantity_addresses_searched_by_state

    return if params[:cep].blank?

    @address = SearchCep.new(params[:cep]).call

    return if @address.present?

    flash.now[:alert] = t('.cep_not_found')
  end
end
