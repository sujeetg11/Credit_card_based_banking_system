class AddDiscardedAtToBranches < ActiveRecord::Migration[7.2]
  def change
    add_column :branches, :discarded_at, :datetime
    add_index :branches, :discarded_at
  end
end
