class TasksController < ApplicationController
  before_action :all_tasks, only: [:index, :create]

  # def index
  #   @tasks = Task.all
  # end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
  end

  def destroy
    @task.destroy
    flash[:notice] = 'Task deleted'
    redirect_to @task
  end

  private

    def all_tasks
      @tasks = Task.all
    end

    def task_params
      params.require(:task).permit(:description, :deadline)
    end
end
