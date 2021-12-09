class CourseRatingsController < ApplicationController
  before_action :current_user_must_be_course_rating_user,
                only: %i[edit update destroy]

  before_action :set_course_rating, only: %i[show edit update destroy]

  def index
    @q = CourseRating.ransack(params[:q])
    @course_ratings = @q.result(distinct: true).includes(:user,
                                                         :course_offering, :comments, :prof).page(params[:page]).per(10)
  end

  def show
    @comment = Comment.new
  end

  def new
    @course_rating = CourseRating.new
  end

  def edit; end

  def create
    @course_rating = CourseRating.new(course_rating_params)

    if @course_rating.save
      message = "CourseRating was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @course_rating, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @course_rating.update(course_rating_params)
      redirect_to @course_rating,
                  notice: "Course rating was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @course_rating.destroy
    message = "CourseRating was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to course_ratings_url, notice: message
    end
  end

  private

  def current_user_must_be_course_rating_user
    set_course_rating
    unless current_user == @course_rating.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_course_rating
    @course_rating = CourseRating.find(params[:id])
  end

  def course_rating_params
    params.require(:course_rating).permit(:user_id, :facet_1_rating,
                                          :facet_2_rating, :facet_3_rating, :facet_4_rating, :facet_5_rating, :descriptive_q1, :descriptive_q2, :descriptive_q3, :course_offering_id)
  end
end
