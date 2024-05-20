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
      redirect_to project_path(@project), notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :body)
  end
end
