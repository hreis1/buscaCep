class HomeController < ApplicationController
  def index
    @addresses_most_searched = Address.most_searched

    return if params[:cep].blank?

    @address = SearchCep.new(params[:cep]).call

    return if @address.present?

    flash.now[:alert] = t('.cep_not_found')
  end
end
