class Medicine < ApplicationRecord
    validates :generic , presence: true
    validates :mg , presence: true 
end
