class Customer < ApplicationRecord
    self.primary_key = "customer_id"
    belongs_to :branch
    has_many :account_transactions, dependent: :destroy # If a customer is deleted, delete transactions
    has_many :user_cards, dependent: :destroy # If a customer is deleted, delete their user cards

    validates :customer_id, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :phone_number, presence: true, uniqueness: true
    validates :first_name, :last_name, :date_of_birth, :address, presence: true
end

