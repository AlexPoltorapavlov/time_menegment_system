# frozen_string_literal: false

class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: %i[edit update destroy show]
  before_action :set_user, only: %i[create index]

  def index
  @projects = @user.projects.page(params[:page])
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
    return if @project.user == current_user

    redirect_to projects_path
    flash.alert = 'У вас нет доступа к этому проекту'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def project_params
    params.require(:project).permit(:title, :body)
  end
end
