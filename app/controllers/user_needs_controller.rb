class UserNeedsController < ApplicationController
  before_action :set_user_need, only: %i[show edit update destroy]

  def index
    @q = UserNeed.ransack(params[:q])
    @user_needs = @q.result(distinct: true).includes(:user).page(params[:page]).per(10)
  end

  def show; end

  def new
    @user_need = UserNeed.new
  end

  def edit; end

  def create
    @user_need = UserNeed.new(user_need_params)

    if @user_need.save
      redirect_to @user_need, notice: "User need was successfully created."
    else
      render :new
    end
  end

  def update
    if @user_need.update(user_need_params)
      redirect_to @user_need, notice: "User need was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user_need.destroy
    redirect_to user_needs_url, notice: "User need was successfully destroyed."
  end

  private

  def set_user_need
    @user_need = UserNeed.find(params[:id])
  end

  def user_need_params
    params.require(:user_need).permit(:facet_1_need, :facet_2_need,
                                      :facet_3_need, :facet_4_need, :facet_5_need, :user_id)
  end
end
