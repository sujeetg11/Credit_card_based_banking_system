class Reward < ApplicationRecord
    belongs_to :account_transaction
    belongs_to :user_card
end
