class Api::V1::CourseOfferingsController < Api::V1::GraphitiController
  def index
    course_offerings = CourseOfferingResource.all(params)
    respond_with(course_offerings)
  end

  def show
    course_offering = CourseOfferingResource.find(params)
    respond_with(course_offering)
  end

  def create
    course_offering = CourseOfferingResource.build(params)

    if course_offering.save
      render jsonapi: course_offering, status: 201
    else
      render jsonapi_errors: course_offering
    end
  end

  def update
    course_offering = CourseOfferingResource.find(params)

    if course_offering.update_attributes
      render jsonapi: course_offering
    else
      render jsonapi_errors: course_offering
    end
  end

  def destroy
    course_offering = CourseOfferingResource.find(params)

    if course_offering.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: course_offering
    end
  end
end
