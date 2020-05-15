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
  end
  def update
  end
  def destroy
  end
private
  def authorized?
    @classroom.user == current_user
  end
end
