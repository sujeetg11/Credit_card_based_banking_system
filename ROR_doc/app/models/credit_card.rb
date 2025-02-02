class CreditCard < ApplicationRecord
    include Discard::Model

    has_many :user_cards, dependent: :destroy

    default_scope -> { kept }
end
