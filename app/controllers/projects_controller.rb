class ProjectsController < ApplicationController
  before_filter :set_project, only: [:show, :update]
  before_filter :set_new_project, only: [:new, :create]

  def new
  end

  def create
    if @project.save
      redirect_to @project, notice: 'created new project'
    else
      render 'new'
    end
  end

  def update
    @project.attributes = project_params
    if @project.save
      redirect_to @project, notice: 'update project'
    else
      redirect_to :back, notice: @project.errors.full_messages.join(',')
    end
  end

  def show
  end

  private

  def set_project
    @project = Project.find_by(key: params[:key])
  end

  def set_new_project
    @project = Project.new(project_params)
  end

  def project_params
    params.fetch(:project, {}).permit(:name)
  end
end
