class CreateChunks < ActiveRecord::Migration
  def change
    create_table :chunks do |t|
      t.belongs_to :subject, index: true
      t.text :question
      t.text :answer
      t.timestamps
    end
  end
end
