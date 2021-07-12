class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :get_category

  def index
    @tasks = @category.tasks.all
    redirect_to category_path(@category)
  end

  def new
    @task = @category.tasks.build
  end

  def create
    @task = @category.tasks.build(task_params)
    if @task.valid?
      @task.save
      redirect_to category_task_path
      flash[:notice] = 'Task created!'
    else
      redirect_to category_path(@category), alert: @task.errors.full_messages.first
    end
  end

  def show
    @task = @category.tasks.find(params[:id])
  end

  def edit
    @task = @category.tasks.find(params[:id])
  end

  def update
    @task = @category.tasks.find(params[:id])

    if @task.update(task_params)
      @task.save
      redirect_to category_tasks_path(@category)
      flash[:notice] = 'Task successfully updated.'
    else
      redirect_to edit_category_task_path(@category), alert: @task.errors.full_messages.first
    end
  end

  def destroy
    @task = @category.tasks.find(params[:id])
    @task.destroy
    redirect_to category_tasks_path, notice: 'Task successfully deleted.'
  end

  private

  def get_category
    @category = current_user.categories.find(params[:category_id])
  end

  def task_params
    params.require(:task).permit(:name, :details, :deadline, :category_id, :completed)
  end
end
