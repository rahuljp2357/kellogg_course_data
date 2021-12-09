class CourseOfferingsController < ApplicationController
  before_action :set_course_offering, only: %i[show edit update destroy]

  def index
    @q = CourseOffering.ransack(params[:q])
    @course_offerings = @q.result(distinct: true).includes(:course, :prof,
                                                           :course_ratings, :quarter).page(params[:page]).per(10)
  end

  def show
    @course_rating = CourseRating.new
  end

  def new
    @course_offering = CourseOffering.new
  end

  def edit; end

  def create
    @course_offering = CourseOffering.new(course_offering_params)

    if @course_offering.save
      message = "CourseOffering was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @course_offering, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @course_offering.update(course_offering_params)
      redirect_to @course_offering,
                  notice: "Course offering was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @course_offering.destroy
    message = "CourseOffering was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to course_offerings_url, notice: message
    end
  end

  private

  def set_course_offering
    @course_offering = CourseOffering.find(params[:id])
  end

  def course_offering_params
    params.require(:course_offering).permit(:course_id, :quarter_id, :prof_id)
  end
end
