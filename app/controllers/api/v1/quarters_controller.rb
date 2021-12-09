class Api::V1::QuartersController < Api::V1::GraphitiController
  def index
    quarters = QuarterResource.all(params)
    respond_with(quarters)
  end

  def show
    quarter = QuarterResource.find(params)
    respond_with(quarter)
  end

  def create
    quarter = QuarterResource.build(params)

    if quarter.save
      render jsonapi: quarter, status: 201
    else
      render jsonapi_errors: quarter
    end
  end

  def update
    quarter = QuarterResource.find(params)

    if quarter.update_attributes
      render jsonapi: quarter
    else
      render jsonapi_errors: quarter
    end
  end

  def destroy
    quarter = QuarterResource.find(params)

    if quarter.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: quarter
    end
  end
end
