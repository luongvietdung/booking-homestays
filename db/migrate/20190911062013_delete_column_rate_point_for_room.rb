class DeleteColumnRatePointForRoom < ActiveRecord::Migration[5.2]
  def self.up
    remove_column :rooms, :rate_point
  end

  def self.down
    add_column :rooms, :rate_point, :decimal
  end
end
