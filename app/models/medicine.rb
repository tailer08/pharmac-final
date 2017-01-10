class Medicine < ApplicationRecord
    has_many :stocks, dependent: :destroy
    
    validates :generic , presence: true
    validates :mg , presence: true 
    def self.search search_term
    where(['generic LIKE ? OR brand LIKE ?', "%#{search_term}%","%#{search_term}%"])
    end
end
