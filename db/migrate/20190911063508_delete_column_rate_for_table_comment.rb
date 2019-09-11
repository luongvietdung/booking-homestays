class DeleteColumnRateForTableComment < ActiveRecord::Migration[5.2]
  def self.up
    remove_column :comments, :rate
  end

  def self.down
    add_column :comments, :rate, :decimal
  end
end
