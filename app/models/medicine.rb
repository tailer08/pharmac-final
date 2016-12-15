class Medicine < ApplicationRecord
    validates :generic , presence: true
    validates :classifcation  , presence: true
    validates :medType , presence: true
    validates :mg , presence: true , numericality: true, length:{minimum:2}
end
