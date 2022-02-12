class Developer::ProjectsController < ApplicationController
  before_action :set_project, only: %i[show]
  def index
    @projects = current_user.projects
  end

  def show
    @change_requests = @project.change_requests
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end
end
