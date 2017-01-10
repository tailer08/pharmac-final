class Stock < ApplicationRecord
    #attr_accessor :price, :quantity
    validates_presence_of :quantity, :message => "Put in quantity" 
    belongs_to :medicine
    validates :quantity, :price , :presence => true
    validates :price, :numericality =>true
    #validates :expiration_date , :presence => true
end
