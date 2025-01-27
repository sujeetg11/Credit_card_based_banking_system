class AccountTransaction < ApplicationRecord
    belongs_to :merchant, class_name: 'Customer'
    belongs_to :user_card
    has_many :rewards, dependent: :destroy
end
