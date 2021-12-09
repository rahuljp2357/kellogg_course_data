class Api::V1::UserNeedsController < Api::V1::GraphitiController
  def index
    user_needs = UserNeedResource.all(params)
    respond_with(user_needs)
  end

  def show
    user_need = UserNeedResource.find(params)
    respond_with(user_need)
  end

  def create
    user_need = UserNeedResource.build(params)

    if user_need.save
      render jsonapi: user_need, status: :created
    else
      render jsonapi_errors: user_need
    end
  end

  def update
    user_need = UserNeedResource.find(params)

    if user_need.update_attributes
      render jsonapi: user_need
    else
      render jsonapi_errors: user_need
    end
  end

  def destroy
    user_need = UserNeedResource.find(params)

    if user_need.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: user_need
    end
  end
end
