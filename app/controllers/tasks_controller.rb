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
      redirect_to project_path(@project), notice: 'Задача была успешно создана'
    else
      render :new
    end
  end

  def update
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  def update_start_time
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])

    @task.start_time = Time.now
    @task.save
  end

  def update_stop_time
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])

    @task.stop_time = Time.now
    @task.duration = @task.duration + (@task.stop_time - @task.start_time)
    @task.start_time = Time.now
    @task.save
  end

  private

  def task_params
    params.require(:task).permit(:title, :body, :duration, :start_time, :stop_time)
  end

end
