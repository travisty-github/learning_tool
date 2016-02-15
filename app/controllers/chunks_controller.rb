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
    chunk.set_next_test_date
    if chunk.save
      flash[:success] = "Created chunk."
    else
      flash[:danger] = "Failed to create chunk."
    end
    redirect_to subjects_path
  end

  # Delete a chunk
  def destroy
    chunk = Chunk.find(params[:id])
    if chunk.delete
      flash[:success] = "Chunk deleted."
    else
      flash[:danger] = "Failed to delete chunk."
    end
    redirect_to subject_chunks_path(params[:subject_id])
  end

  # Edit form for a chunk
  def edit
    @chunk = Chunk.find(params[:id])
  end

  # Update a chunk
  def update
    chunk = Chunk.find(params[:id])
    if chunk.update(chunk_params)
      flash[:success] = "Chunk updated."
    else
      flash[:danger] = "Failed to update chunk."
    end
    redirect_to subject_chunks_path(params[:subject_id])
  end

  private
    # Allow specified form parameters to be saved
    def chunk_params
      params.require(:chunk).permit(:question, :answer, :subject_id)
    end

end
