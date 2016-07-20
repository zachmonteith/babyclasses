class CoursesController < ApplicationController
  before_action :require_admin!, except: (:index, :show)


    def index
      @courses = Course.all
      render :index
    end

    def show
      @course = course.find(params[:id])
      render :show
    end

    def new
      @course = course.new
      render :new
    end

    def create
      @course = current_user.courses.new(course_params)
      if @course.save
        redirect_to course_url(@course)
      else
        flash.now[:errors] = @course.errors.full_messages
        render :new
      end
    end

    def edit
      @course = current_user.courses.find(params[:id])
      render :edit
    end

    def update
      @course = current_user.courses.find(params[:id])
      if @course.update_attributes(course_params)
        redirect_to course_url(@course)
      else
        flash.now[:errors] = @course.errors.full_messages
        render :edit
      end
    end

    private

    def course_params
      params.require(:course)
        .permit(:course_name, :course_date, :course_time, :max_size, :user_id, :description)
    end

end
