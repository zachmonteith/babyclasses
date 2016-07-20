class StudentsController < ApplicationController
before_action :require_user!


  def show
    @student = Student.find(params[:id])
    if current_user.owns_student?(@student)
      render :show
    else
      redirect_to new_session_url
    end
  end

  def edit
    @student = current_user.students.find(params[:id])
    render :edit
  end

  def new
    @student = Student.new
    render :new
  end

  def create
    @student = current_user.students.new(student_params)
    if @student.save
      render :show
    else
      flash.now[:errors] = @student.errors.full_messages
      render :new
    end
  end

  def update
    @student = current_user.students.find(params[:id])
    if @student.update_attributes(student_params)
      redirect_to student_url(@student)
    else
      flash.now[:errors] = @student.errors.full_messages
      render :edit
    end
  end

  private
  def student_params
    params.require(:student).permit(:name, :birthday, :chaperones, :notes)
  end

end
