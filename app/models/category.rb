class Category < ApplicationRecord
    has_one :order
    has_one_attached :photo
    has_one :size
end
