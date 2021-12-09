class Api::V1::CoursesController < Api::V1::GraphitiController
  def index
    courses = CourseResource.all(params)
    respond_with(courses)
  end

  def show
    course = CourseResource.find(params)
    respond_with(course)
  end

  def create
    course = CourseResource.build(params)

    if course.save
      render jsonapi: course, status: :created
    else
      render jsonapi_errors: course
    end
  end

  def update
    course = CourseResource.find(params)

    if course.update_attributes
      render jsonapi: course
    else
      render jsonapi_errors: course
    end
  end

  def destroy
    course = CourseResource.find(params)

    if course.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: course
    end
  end
end
