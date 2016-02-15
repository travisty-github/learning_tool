class AddNextTestDateToChunks < ActiveRecord::Migration
  def change
    add_column :chunks, :next_test_date, :date
  end
end
