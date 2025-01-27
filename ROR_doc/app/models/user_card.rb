class UserCard < ApplicationRecord
    belongs_to :customer
    belongs_to :credit_card
    has_many :account_transactions, dependent: :destroy # If a user card is deleted, delete transactions
    has_many :rewards, dependent: :destroy # If a user card is deleted, delete rewards
  end
