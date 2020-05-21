class ClassroomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @classrooms = Classroom.all
  end

  def show
    @classroom = Classroom.find(params[:id])
    @students = @classroom.students.order(:created_at)
    @student = @classroom.students.new
  end
  
  def edit
    @classroom = Classroom.find(params[:id])
  end

  def create
    @user = current_user
    @classroom = @user.classrooms.build(classroom_params)
    if @classroom.save
      redirect_to classrooms_path
    else
      return
    end
  end

  def new
  end
  
  def update
    @classroom = Classroom.find(params[:id])
    if @classroom.update(classroom_params)
      redirect_to classrooms_path
    else
      redirect_to classrooms_path
    end
  end

  def destroy
    @classroom = Classroom.find(params[:id])
    @classroom.destroy
    redirect_to classrooms_path
  end

private

  def classroom_params
    params.require(:classroom).permit(:subject_name, student_attributes:[:id, :name])
  end

  # def authorized?
  #   @classroom.user == current_user
  # end
end
