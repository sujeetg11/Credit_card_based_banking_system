class Branch < ApplicationRecord
    has_many :customers, dependent: :destroy
    validates :branch_id, :branch_name, :branch_address, :branch_manager, :branch_phone, :branch_email, presence: true
end
