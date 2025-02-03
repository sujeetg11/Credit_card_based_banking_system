# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end




Branch.find_or_create_by!(branch_id: "C001") do |branch|
  branch.branch_name = "Kiwale"
  branch.branch_address = "Dehuroad, Kiwale"
  branch.branch_manager = "Sujeet Gupta"
  branch.branch_phone = "1234567890"
  branch.branch_email = "kiwale@bank.com"
end

Branch.find_or_create_by!(branch_id: "C002") do |branch|
  branch.branch_name = "Pune main"
  branch.branch_address = "Pune rails station road"
  branch.branch_manager = "Bhimrao Gulshan"
  branch.branch_phone = "8978803576"
  branch.branch_email = "punemain@bank.com"
end

CreditCard.find_or_create_by!(credit_card_id: "CC003") do |card|
  card.type_of_card = "Silver"
  card.credit_limit = 88888888
end

CreditCard.find_or_create_by!(credit_card_id: "CC004") do |card|
  card.type_of_card = "Gold"
  card.credit_limit = 7777777
end

CreditCard.find_or_create_by!(credit_card_id: "CC005") do |card|
  card.type_of_card = "Platinum"
  card.credit_limit = 50000000
end

Customer.find_or_create_by!(customer_id: "C005") do |customer|
  customer.first_name = "AAA"
  customer.last_name = "bbb"
  customer.date_of_birth = "2002-01-01"
  customer.email = "aaa@bank.com"
  customer.phone_number = 1230984675
  customer.address = "aaa chowk"
  customer.branch_id = "C001"
end

Customer.find_or_create_by!(customer_id: "C006") do |customer|
  customer.first_name = "CCC"
  customer.last_name = "ddd"
  customer.date_of_birth = "2003-11-01"
  customer.email = "ccc@bank.com"
  customer.phone_number = 1256789475
  customer.address = "cc chowk"
  customer.branch_id = "C001"
end

Customer.find_or_create_by!(customer_id: "C007") do |customer|
  customer.first_name = "XX"
  customer.last_name = "YY"
  customer.date_of_birth = "2000-03-05"
  customer.email = "xx@bank.com"
  customer.phone_number = 987678954
  customer.address = "xx & yy nagar"
  customer.branch_id = "C002"
end

UserCard.find_or_create_by!(user_card_id: "UC001") do |card|
  card.credit_card_id = "CC003"
  card.customer_id = "C005"
  card.issue_date = "2023-11-07"
  card.expiry_date = "2043-11-07"
  card.cvv = 742
  card.is_active = true
  card.available_limit = 40000
end

UserCard.find_or_create_by!(user_card_id: "UC002") do |card|
  card.credit_card_id = "CC004"
  card.customer_id = "C007"
  card.issue_date = "2022-10-08"
  card.expiry_date = "2042-10-08"
  card.cvv = 722
  card.is_active = true
  card.available_limit = 400000
end

UserCard.find_or_create_by!(user_card_id: "UC003") do |card|
  card.credit_card_id = "CC005"
  card.customer_id = "C006"
  card.issue_date = "2024-01-10"
  card.expiry_date = "2044-01-10"
  card.cvv = 899
  card.is_active = true
  card.available_limit = 1000000
end

AccountTransaction.find_or_create_by!(account_transaction_id: "T001") do |txn|
  txn.user_card_id = "UC001"
  txn.transaction_date = Time.now
  txn.amount = 500.50
  txn.merchant_id = "C005"
  txn.location = "Mumbai"
  txn.transaction_type = "purchase"
end

AccountTransaction.find_or_create_by!(account_transaction_id: "T002") do |txn|
  txn.user_card_id = "UC002"
  txn.transaction_date = Time.now
  txn.amount = 1200.75
  txn.merchant_id = "C007"
  txn.location = "Pune"
  txn.transaction_type = "withdrawal"
end

AccountTransaction.find_or_create_by!(account_transaction_id: "T003") do |txn|
  txn.user_card_id = "UC003"
  txn.transaction_date = Time.now
  txn.amount = 7500.00
  txn.merchant_id = "C006"
  txn.location = "Delhi"
  txn.transaction_type = "deposit"
end

Reward.find_or_create_by!(reward_id: "R001") do |reward|
  reward.account_transaction_id = "T001"
  reward.user_card_id = "UC001"
  reward.points_earned = 50
  reward.points_redeemed = 0
end

Reward.find_or_create_by!(reward_id: "R002") do |reward|
  reward.account_transaction_id = "T002"
  reward.user_card_id = "UC002"
  reward.points_earned = 100
  reward.points_redeemed = 10
end

Reward.find_or_create_by!(reward_id: "R003") do |reward|
  reward.account_transaction_id = "T003"
  reward.user_card_id = "UC003"
  reward.points_earned = 200
  reward.points_redeemed = 20
end
