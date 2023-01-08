class Calendar < ApplicationRecord
    belongs_to :instudio,  inverse_of: :calendar
end
