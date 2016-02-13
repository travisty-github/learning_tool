class AddTestSequenceToChunks < ActiveRecord::Migration
  def change
    add_column :chunks, :test_sequence_number, :integer
  end
end
