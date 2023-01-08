class Order < ApplicationRecord
  belongs_to :user
  belongs_to :angle, optional: true
  belongs_to :background, optional: true
  belongs_to :category, optional: true
  belongs_to :client, optional: true
  belongs_to :size, optional: true
  # has_one :briefing, optional: true
  # has_one :delivery

  has_one_attached :upload

end
