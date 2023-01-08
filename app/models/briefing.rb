class Briefing < ApplicationRecord
    belongs_to :order, optional: true

    has_one_attached :upload1
    has_one_attached :upload2


end
