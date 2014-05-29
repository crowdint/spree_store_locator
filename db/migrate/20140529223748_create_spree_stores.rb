class CreateSpreeStores < ActiveRecord::Migration
  def change
    create_table :spree_stores do |t|
      t.string :address1,  null: false, default: ''
      t.string :address2
      t.string :city,      null: false, default: ''
      t.string :country,   null: false, default: ''
      t.float  :latitude
      t.float  :longitude
      t.string :name
      t.string :phone
      t.string :state,     null: false, default: ''
      t.string :website
      t.string :zip,       null: false, default: ''

      t.timestamps
    end
  end
end

