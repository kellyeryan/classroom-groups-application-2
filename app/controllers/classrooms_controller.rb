class ClassroomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @classrooms = Classroom.all
  end
  def show
    if authorized?
      @classroom=Classroom.find(params[:id])
      render :show
    end
  end
  def create
    @classroom = current_user.classrooms.build(classroom_params)
    if @classroom.save
      format.json { render :show, status: :created, location: classroom_path(@classroom) }
    else
      return
    end
  end
  def update
  end
  def destroy
  end
private

  def classroom_params
    params.require(:classroom).permit(:subject_name)
  end

  def authorized?
    @classroom.user == current_user
  end
end
