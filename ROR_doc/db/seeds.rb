# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end




# Seeding Transactions
transactions = AccountTransaction.create([
  { transaction_id: 'T001', user_card_id: 'UC001', transaction_date: '2023-01-01 12:00:00', amount: 150.00, merchant_id: 'C002', location: 'Store 1', transaction_type: 'purchase' },
  { transaction_id: 'T002', user_card_id: 'UC002', transaction_date: '2023-01-02 15:30:00', amount: 200.00, merchant_id: 'C001', location: 'Store 2', transaction_type: 'purchase' }
])



puts "Seed data has been added successfully!"
