class ProjectsController < ApplicationController
  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  def create
    @user = User.find(params[:user_id])
    @project = @user.projects.create(project_params)

    if @project.save
      redirect_to @project, notice: "Проект успешно создан"
    else
      flash.now[:error] = @project.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @project = Project.find (params[:id])
  end

  def update
    @project = Project.find (params[:id])
    if @project.update(project_params)
      redirect_to @project
    else
      flash.now[:error] = @project.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project = Project.find (params[:id])
    @project.destroy
    redirect_to projects_path
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:title, :body)
  end

end
