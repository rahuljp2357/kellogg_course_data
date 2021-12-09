class Api::V1::CourseRatingsController < Api::V1::GraphitiController
  def index
    course_ratings = CourseRatingResource.all(params)
    respond_with(course_ratings)
  end

  def show
    course_rating = CourseRatingResource.find(params)
    respond_with(course_rating)
  end

  def create
    course_rating = CourseRatingResource.build(params)

    if course_rating.save
      render jsonapi: course_rating, status: 201
    else
      render jsonapi_errors: course_rating
    end
  end

  def update
    course_rating = CourseRatingResource.find(params)

    if course_rating.update_attributes
      render jsonapi: course_rating
    else
      render jsonapi_errors: course_rating
    end
  end

  def destroy
    course_rating = CourseRatingResource.find(params)

    if course_rating.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: course_rating
    end
  end
end
