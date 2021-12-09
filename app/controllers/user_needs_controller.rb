class UserNeedsController < ApplicationController
  before_action :set_user_need, only: [:show, :edit, :update, :destroy]

  # GET /user_needs
  def index
    @user_needs = UserNeed.all
  end

  # GET /user_needs/1
  def show
  end

  # GET /user_needs/new
  def new
    @user_need = UserNeed.new
  end

  # GET /user_needs/1/edit
  def edit
  end

  # POST /user_needs
  def create
    @user_need = UserNeed.new(user_need_params)

    if @user_need.save
      redirect_to @user_need, notice: 'User need was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /user_needs/1
  def update
    if @user_need.update(user_need_params)
      redirect_to @user_need, notice: 'User need was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /user_needs/1
  def destroy
    @user_need.destroy
    redirect_to user_needs_url, notice: 'User need was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_need
      @user_need = UserNeed.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_need_params
      params.require(:user_need).permit(:facet_1_need, :facet_2_need, :facet_3_need, :facet_4_need, :facet_5_need, :user_id)
    end
end
