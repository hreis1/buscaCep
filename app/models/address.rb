class Address < ApplicationRecord
  self.primary_key = 'cep'

  scope :most_searched, -> { order(quantity_searched: :desc).limit(3) }
  scope :most_searched_by_state, -> { group(:state).order(quantity_searched: :desc).limit(3) }
end
