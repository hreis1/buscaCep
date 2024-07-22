class Address < ApplicationRecord
  self.primary_key = 'cep'

  def self.most_searched
    order(quantity_searched: :desc).limit(3)
  end
end
