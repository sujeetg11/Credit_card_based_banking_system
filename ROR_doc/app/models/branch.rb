class Branch < ApplicationRecord
    include Discard::Model
    self.primary_key = "branch_id"

    default_scope -> { kept }
    before_create :generate_branch_id
  
    # Presence and length validations
    validates :branch_name, presence: true, length: { maximum: 50 }
    validates :branch_address, presence: true
    validates :branch_manager, presence: true, length: { maximum: 50 }
    
    # Phone number validation (must be exactly 10 digits)
    validates :branch_phone, presence: true, uniqueness: true, 
                             format: { with: /\A\d{10}\z/, message: "must be exactly 10 digits" }
    
    # Email validation (must contain @ and be a valid email format)
    validates :branch_email, presence: true, uniqueness: true, 
                             format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }
  
    private
  
    def generate_branch_id
      last_branch = Branch.order(branch_id: :desc).first
  
      if last_branch && last_branch.branch_id.match?(/^C\d+$/)
        last_number = last_branch.branch_id[1..].to_i
        new_number = last_number + 1
        self.branch_id = "C#{new_number.to_s.rjust(3, '0')}"
      else
        self.branch_id = "C001"
      end
    end
  end
  