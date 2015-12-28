class ChunksController < ApplicationController

  # Show list of all chunks for a specified subject
  def index
    @chunks = Chunk.where(subject_id: params[:subject_id])
  end

  # Form for creating a new chunk
  def new
    @chunk = Chunk.new
  end

  # Create a new chunk in the database and flash message
  def create
    chunk = Chunk.new(chunk_params)
    chunk[:subject_id] = params[:subject_id]
    if chunk.save
      flash[:success] = "Created chunk."
    else
      flash[:danger] = "Failed to create chunk."
    end
    redirect_to subjects_path
  end

  private
    # Allow specified form parameters to be saved
    def chunk_params
      params.require(:chunk).permit(:question, :answer, :subject_id)
    end

end
