class Spree::Store < ActiveRecord::Base
  validates :address1, :city, :country, :state, :zip, presence: true

  scope :state_ordered, -> { order('state ASC') }

end

