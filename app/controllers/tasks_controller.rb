class TasksController < ApplicationController
  def index
    @projects = current_user.projects
    @tasks = Task.joins(:project).where(projects: {user_id: current_user.id})

    if params[:project_id].present?
      @tasks = Task.where(project_id: params[:project_id])
    else
      @tasks = Task.all
    end

    # сортировка
    case params[:sort]
    when 'title'
      @tasks = @tasks.order(title: :asc)
    when 'created_at'
      @tasks = @tasks.order(created_at: :asc)
    when 'updated_at'
      @tasks = @tasks.order(updated_at: :asc)
    when 'project'
      @tasks = @tasks.includes(:project).order('projects.title')
    else
      @tasks = @tasks.order(created_at: :desc) # сортировка по умолчанию
    end
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
      flash[:error] = @task.errors.full_messages.join(", ")
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:notice] = 'Задача успешно сохранена'
      redirect_to @task
    else
      flash[:error] = @task.errors.full_messages.join(", ")
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
    @projects = current_user.projects
  end

  def destroy
    @task = Task.find(params[:id])
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :body, :project_id)
  end
end
