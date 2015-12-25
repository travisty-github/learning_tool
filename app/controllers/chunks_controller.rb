class ChunksController < ApplicationController
  def index
    @chunks = Chunk.where(subject_id: params[:subject_id])
  end
end
