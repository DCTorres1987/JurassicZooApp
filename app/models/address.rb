class Address < ApplicationRecord
    belongs_to :user
    validates_presence_of :address1, :city, :state, :city, :state, :zip
end
