class Background < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :product, optional: true
  has_one_attached :photo
end
