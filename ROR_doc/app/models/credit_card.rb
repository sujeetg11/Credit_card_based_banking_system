class CreditCard < ApplicationRecord
    has_many :user_cards, dependent: :destroy
end
