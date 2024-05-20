class TasksController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @tasks = @project.tasks
  end

  def new
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build(task_params)

    if @task.save
      redirect_to project_path(@project), notice: 'Задача была успешно выполнена'
    else
      render :new
    end
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to @task
    else
      render :edit
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :body, :duration)
  end
end
