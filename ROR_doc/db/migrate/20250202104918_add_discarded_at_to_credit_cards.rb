class AddDiscardedAtToCreditCards < ActiveRecord::Migration[7.2]
  def change
    add_column :credit_cards, :discarded_at, :datetime
  end
end
