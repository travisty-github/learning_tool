class AddDefaultValueToTestSequenceNumber < ActiveRecord::Migration
  def change
    change_column :chunks, :test_sequence_number, :integer, default: 0
  end
end
