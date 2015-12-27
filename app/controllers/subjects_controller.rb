class SubjectsController < ApplicationController

  def index
    @subjects = Subject.all
  end

  def test
    @chunks = Chunk.where(subject_id: params[:subject_id])
    puts "SubjectsController#test"
  end

end
