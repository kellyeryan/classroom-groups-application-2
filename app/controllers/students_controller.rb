class StudentsController < ApplicationController

  def edit
    @classroom = Classroom.find(params[:classroom_id])
    @student = Student.find(params[:id])
  end
  
  def create
    @classroom = Classroom.find(params[:classroom_id])
    @student = @classroom.students.create(student_params)
    redirect_to classroom_path(@classroom)  
  end

  def update
    @classroom = Classroom.find(params[:classroom_id])
    @student = Student.find(params[:id])
    if @classroom.students.update(student_params)
      redirect_to classroom_path(@classroom)
    end
  end

  def destroy
  end

private
  def student_params
    params.require(:student).permit(:name, :classroom_id)
  end
end
