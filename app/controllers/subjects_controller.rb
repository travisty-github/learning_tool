class SubjectsController < ApplicationController

  # List all subjects
  def index
    @subjects = Subject.all
  end

  # Perform test of a specific subject
  def test
    @chunks = Chunk.where(subject_id: params[:subject_id])
    @subject_id = params[:subject_id]
    js 'Subjects'
  end

  # Save answer to a chunk
  def answer
    RecallTest.create(recalled_correctly: params[:answer_correct],
                      chunk_id: params[:chunk_id],  recall_date: Time.now)
    render nothing: true
  end

  # Form for a new subject
  def new
    @subject = Subject.new
  end

  # Save new subject
  def create
    s = Subject.new(subject_params)
    if s.save
      flash[:success] = "Subject created."
    else
      flash[:danger] = "Failed to create subject."
    end
    redirect_to subjects_path
  end

  # Delete subject and all associatd chunks
  def destroy
    if Subject.destroy_all(id: params[:id])
      flash[:success] = "Subject deleted."
    else
      flash[:danger] = "Failed to delete subject."
    end

    # Return to index
    redirect_to subjects_path
  end

  private
    # Whitelist parameters
    def subject_params
      params.require(:subject).permit(:title)
    end

end
