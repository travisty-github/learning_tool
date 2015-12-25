class Chunk < ActiveRecord::Base
  belongs_to :subject
  has_many :recall_tests
end
