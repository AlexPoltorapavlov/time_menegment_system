class TasksController < ApplicationController
  def index
    @tasks = Task.joins(:project).where(projects: {user_id: current_user.id})
  end

  def new
    @task = Task.new
    @projects = current_user.projects
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @projects = current_user.projects
    @task = Task.new(task_params)

    if @task.save
      flash[:notice] = 'Задача успешно создана'
      redirect_to @task
    else
      flash[:error] = @task.error.full_messages.join(", ")
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:title, :body, :project_id)
  end

end
