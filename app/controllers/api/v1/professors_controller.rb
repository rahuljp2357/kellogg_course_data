class Api::V1::ProfessorsController < Api::V1::GraphitiController
  def index
    professors = ProfessorResource.all(params)
    respond_with(professors)
  end

  def show
    professor = ProfessorResource.find(params)
    respond_with(professor)
  end

  def create
    professor = ProfessorResource.build(params)

    if professor.save
      render jsonapi: professor, status: :created
    else
      render jsonapi_errors: professor
    end
  end

  def update
    professor = ProfessorResource.find(params)

    if professor.update_attributes
      render jsonapi: professor
    else
      render jsonapi_errors: professor
    end
  end

  def destroy
    professor = ProfessorResource.find(params)

    if professor.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: professor
    end
  end
end
