class HomeController < ApplicationController
  def index
    @address = {}
    @addresses_most_searched = Address.order(quantity_searched: :desc).limit(3)

    return if params[:cep].blank?

    @address = Address.find_by(cep: params[:cep])
    if @address.present?
      @address.increment!(:quantity_searched)
      return
    end

    response = Faraday.get("https://cep.awesomeapi.com.br/json/#{params[:cep]}")
    @address = { cep: params[:cep] }
    if response.status == 404
      @error = t('.cep_not_found')
    elsif response.status == 400
      @error = t('.cep_invalid')
    elsif response.status == 200
      @response = response
      @address = JSON.parse(response.body).symbolize_keys
      Address.create( cep: @address[:cep],
                      address: @address[:address],
                      state: @address[:state],
                      city: @address[:city],
                      ddd: @address[:ddd],
                      quantity_searched: 1)
    else
      @error = t('.error')
    end
  end
end
