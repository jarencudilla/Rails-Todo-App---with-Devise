class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.categories.order("created_at DESC")
  end

  def new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.build(category_params)

    if @category.valid?
        @category.save
        redirect_to home_path
        flash[:notice] = "Category created!"
    else
      redirect_to new_category_path, alert: @category.errors.full_messages.first
    end
  end

  def show
    @category = current_user.categories.find(params[:id])
  end

  def edit
    @category = current_user.categories.find(params[:id])
  end

  def update
    @category = current_user.categories.find(params[:id])

    if @category.update(category_params)
      redirect_to home_path, notice: "Category successfully updated."

    else
      redirect_to edit_category_path, alert: @category.errors.full_messages.first
    end
  end

  def destroy
    @category = current_user.categories.find(params[:id])
    @category.destroy
    redirect_to home_path, notice: "Category successfully deleted."
  end

  private
  
  def category_params
    params.require(:category).permit(:name, :details)
  end

end
