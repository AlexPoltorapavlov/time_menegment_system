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
    @task = Task.find(params[:id])

    calculate_duration

    @task.update_attribute(:duration, @task.duration + @duration)
    redirect_to project_path(@project)
  end

  private

  def task_params
    params.require(:task).permit(:title, :body, :duration)
  end

  def calculate_duration
    hour_seconds = params[:task][:hours].to_i * 3600
    minute_seconds = params[:task][:minutes].to_i * 60
    second_seconds = params[:task][:seconds].to_i

    @duration = hour_seconds + minute_seconds + second_seconds
  end

end
