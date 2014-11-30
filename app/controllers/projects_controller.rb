class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]
  before_action :set_new_project, only: [:new, :create]

  def new
  end

  def create
    if @project.save
      redirect_to @project, notice: 'created new project'
    else
      render 'new'
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
