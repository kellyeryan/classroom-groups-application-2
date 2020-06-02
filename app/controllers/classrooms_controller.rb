class ClassroomsController < ApplicationController
  before_action :authenticate_user!
  helper_method :create_groups_of_students

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
    students = @classroom.students
    if @classroom.update(classroom_params)
      redirect_to classroom_path(@classroom)
    else
      redirect_to classrooms_path
    end
  end

  def destroy
    @classroom = Classroom.find(params[:id])
    @classroom.destroy
    redirect_to classrooms_path
  end

  def create_groups_of_students
    @classroom = Classroom.find(params[:id])
    student_array = @classroom.students.map { |student| student.name }
    new_array = student_array.shuffle.in_groups_of(@classroom.group_size, false)
    new_array
  end

private

  def classroom_params
    params.require(:classroom).permit(:subject_name, :group_size, student_attributes:[:id, :name])
  end

  # def authorized?
  #   @classroom.user == current_user
  # end
end
