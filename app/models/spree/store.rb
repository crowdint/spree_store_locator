class Spree::Store < ActiveRecord::Base
  validates :address1, :city, :country, :state, :zip, presence: true

end


