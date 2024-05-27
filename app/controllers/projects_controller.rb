# frozen_string_literal: false

# Controller of projects
class ProjectsController < ApplicationController
  before_action :set_project, only: %i[edit update destroy]
  before_action :ser_user, only: %i[create]

  def index
    if current_user
      @projects = current_user.projects
    else
      redirect_to sign_in_path
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = @user.projects.create(project_params)

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
      redirect_to @project
    else
      flash.now[:error] = @project.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  def show
    @project = current_user.projects.find!(params[:id])
    redirect_to projects_path, alert: 'У вас нет доступа к этому проекту'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def project_params
    params.require(:project).permit(:title, :body)
  end
end
