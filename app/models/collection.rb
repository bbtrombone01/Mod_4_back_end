class Collection < ApplicationRecord
    belongs_to :card
    belongs_to :user
end
