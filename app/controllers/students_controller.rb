class StudentsController < ApplicationController

  def create
    @classroom = Classroom.find(params[:classroom_id])
    @student = @classroom.students.create(student_params)
    redirect_to classroom_path(@classroom)  
  end

  def update
  end

  def destroy
  end

private
  def student_params
    params.require(:student).permit(:name, :classroom_id)
  end
end
