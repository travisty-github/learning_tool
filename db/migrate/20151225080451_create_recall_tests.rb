class CreateRecallTests < ActiveRecord::Migration
  def change
    create_table :recall_tests do |t|
      t.belongs_to :chunk, index: true
      t.boolean :recalled_correctly
      t.datetime :recall_date
    end
  end
end
