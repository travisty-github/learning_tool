class SubjectsController < ApplicationController

  # List all subjects
  def index
    @subjects = Subject.all
  end

  # Perform test of a specific subject
  def test
    @chunks = Chunk.where(subject_id: params[:subject_id])
    @subject_id = params[:subject_id]
  end

  # Save answer to a chunk
  def answer
    RecallTest.create(recalled_correctly: params[:answer_correct],
                      chunk_id: params[:chunk_id],  recall_date: Time.now)
    render nothing: true
  end

end
