class SearchCep
  URL_AWESOME = 'https://cep.awesomeapi.com.br/json/'.freeze

  def initialize(cep)
    @cep = cep.to_s.gsub(/\D/, '')
  end

  def call
    return unless cep_valid?

    search_address
  end

  private

  def cep_valid?
    @cep.length == 8
  end

  def search_address
    if (address_in_db = Address.find_by(cep: @cep))
      address_in_db.increment!(:quantity_searched)
    else
      search_address_in_api
    end
  end

  def search_address_in_api
    response = Faraday.get(URL_AWESOME + @cep)
    return unless response.success?

    address = JSON.parse(response.body)
    Address.create(cep: @cep,
                   address: address['address'],
                   city: address['city'],
                   state: address['state'],
                   ddd: address['ddd'],
                   quantity_searched: 1)
  end
end
