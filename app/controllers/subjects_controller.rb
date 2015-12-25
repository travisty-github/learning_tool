class SubjectsController < ApplicationController

  def index
    @subjects = Subject.all
  end

  def test
    @chunks = Chunk.where(subject_id: params[:subject_id])
  end

end
