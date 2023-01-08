class Instudio < ApplicationRecord
  belongs_to :user

  belongs_to :product, optional: true
  belongs_to :moodboard, optional: true
  has_one :calendar, inverse_of: :instudio
  belongs_to :addon, optional: true
  belongs_to :client, optional: true
end
