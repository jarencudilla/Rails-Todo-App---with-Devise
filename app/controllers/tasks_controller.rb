class TasksController < ApplicationController
before_action :authenticate_user!
before_action :get_category

  def index
    @tasks = @category.tasks
  end

  def new
    @task = @category.tasks.build
  end

  def create
    @task = @category.tasks.build(task_params)

      if @task.save
      redirect_to category_path(@category)
      flash[:notice] = 'Task created!'

    else
      redirect_to new_category_task_path, alert: @task.errors.full_messages.first
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
      redirect_to category_url(@category)
      flash[:notice] = 'Task successfully updated.'

    else
      redirect_to category_task_path, alert: @task.errors.full_messages.first
    end
  end

  def destroy
    @task = @category.tasks.find(params[:id])
    @task.destroy
    redirect_to category_url(@category), notice: 'Task successfully deleted.'
  end

  private

  def get_category
    @category = Category.find(params[:category_id]) #category id is the foreign key in the task
  end

  def task_params
    params.require(:task).permit(:title, :description, :deadline, :category_id)
  end

end
