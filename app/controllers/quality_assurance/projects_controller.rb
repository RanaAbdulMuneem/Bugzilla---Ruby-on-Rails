class QualityAssurance::ProjectsController < ApplicationController
  before_action :set_project, only: %i[show]
  def index
    @projects = current_user.projects
  end

  def show
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end
end
