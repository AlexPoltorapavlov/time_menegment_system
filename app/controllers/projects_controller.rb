# frozen_string_literal: false

class ProjectsController < AuthenticatedController
  load_and_authorize_resource

  def index
    @projects = Project.accessible_by(current_ability).page(params[:page])
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      redirect_to @project, notice: 'Проект успешно создан'
    else
      flash.now[:error] = @project.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Проект успешно обновлен!"
    else
      flash.now[:error] = @project.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  def show; end

  private

  def project_params
    params.require(:project).permit(:title, :body)
  end
end
