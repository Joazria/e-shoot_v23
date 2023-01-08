class Product < ApplicationRecord
    has_one_attached :photo

    has_one :moodboard
    has_one :addon
    
end
