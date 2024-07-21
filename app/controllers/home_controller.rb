class HomeController < ApplicationController
  def index
    @address = {}
    @error = nil

    return if params[:cep].blank?

    response = Faraday.get("https://cep.awesomeapi.com.br/json/#{params[:cep]}")

    if response.status == 404
      @error = t('.cep_not_found')
      @address[:cep] = params[:cep]
    elsif response.status == 400
      @error = t('.cep_invalid')
      @address[:cep] = params[:cep]
    else
      @response = response
      @address = JSON.parse(response.body).symbolize_keys
    end
  end
end
