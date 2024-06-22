class TasksController < AuthenticatedController
  before_action :set_projects, only: %i[index new create edit]
  before_action :set_task, only: %i[show update edit destroy]
  load_and_authorize_resource

  has_scope :by_project
  has_scope :sorted_by, only: :index

  def index
    @tasks = apply_scopes(Task).accessible_by(current_ability).page(params[:page])
    @decorated_tasks = TaskDecorator.decorate_collection(@tasks)
  end

  def show
    @timers = apply_scopes(@task.timers).sorted_by(params[:sort]).page(params[:page])
    @decorated_timers = TimerDecorator.decorate_collection(@timers)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task, notice: 'Задача успешно создана'
    else
      flash.now[:error] = @task.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Задача успешно сохранена'
    else
      flash.now[:error] = @task.errors.full_messages.join(', ')
      render :edit, status: :unprocessable_entity
    end
  end

  def edit; end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'Задача успешно удалена'
  end

  private

  def set_projects
    @projects = Project.accessible_by(current_ability)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :body, :project_id)
  end
end
