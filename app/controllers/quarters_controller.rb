class QuartersController < ApplicationController
  before_action :set_quarter, only: %i[show edit update destroy]

  def index
    @q = Quarter.ransack(params[:q])
    @quarters = @q.result(distinct: true).includes(:course_offerings,
                                                   :courses).page(params[:page]).per(10)
  end

  def show
    @course_offering = CourseOffering.new
  end

  def new
    @quarter = Quarter.new
  end

  def edit; end

  def create
    @quarter = Quarter.new(quarter_params)

    if @quarter.save
      redirect_to @quarter, notice: "Quarter was successfully created."
    else
      render :new
    end
  end

  def update
    if @quarter.update(quarter_params)
      redirect_to @quarter, notice: "Quarter was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @quarter.destroy
    redirect_to quarters_url, notice: "Quarter was successfully destroyed."
  end

  private

  def set_quarter
    @quarter = Quarter.find(params[:id])
  end

  def quarter_params
    params.require(:quarter).permit(:season, :year)
  end
end
