class Stock < ApplicationRecord
    attr_accessor :price, :quantity, :medicine
    belongs_to :medicine, dependent: :destroy 
    validates :quantity, :price , :presence => true
    validates :price, :numericality =>true
end
