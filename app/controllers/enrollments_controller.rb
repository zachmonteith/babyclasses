class EnrollmentsController < ApplicationController
  before_action :require_user!

  def new
    @enrollment = Enrollment.new
    render :new
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    if @enrollment.save
      redirect_to course_url(Courses.find_by(id: enrollment_params.course_id))
    else
      flash.now[:errors] = @enrollment.errors.full_messages
      render :new
    end
  end

  def edit
    @enrollment = Enrollment.find(params[:id])
    render :edit
  end

  def update
    @enrollment = Enrollment.find(params[:id])
    if @enrollment.update_attributes(enrollment_params)
      redirect_to course_url(Courses.find_by(id: enrollment_params.course_id))
    else
      flash.now[:errors] = @enrollment.errors.full_messages
      render :edit
  end

  def destroy
    redirect_to courses_url
  end


  private

  def enrollment_params
    params.require(:enrollment).permit(:student_id, :course_id)
  end

end
