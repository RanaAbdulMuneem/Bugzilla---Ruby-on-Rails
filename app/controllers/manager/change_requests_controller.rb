class Manager::ChangeRequestsController < ApplicationController
  before_action :set_change_request, only: %i[show]

  def show
    @project = Project.find_by(id: @change_request.project_id)
    @qa = QualityAssurance.find_by(id: @change_request.user_id)
    @developers = @change_request.developers
  end

  private
    def set_change_request
      @change_request = ChangeRequest.find(params[:id])
    end
end
