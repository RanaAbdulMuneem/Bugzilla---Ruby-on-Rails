class Developer::ChangeRequestsController < ApplicationController
  before_action :set_change_request, only: %i[show assign update]

  def show
    @project = Project.find_by(id: @change_request.project_id)
    @qa = QualityAssurance.find_by(id: @change_request.user_id)
    @developers = @change_request.developers
  end

  def assign
    dev = Developer.find(current_user.id)
    @change_request.developers << dev unless @change_request.developers.include? dev
    @change_request.update(status: 'started')
    redirect_to developer_project_path(@change_request.project)
  end

  def update
    if (@change_request.type == 'Bug')
      @change_request.update(status: 'resolved')
    else
      @change_request.update(status: 'completed')
    end
    redirect_to developer_project_path(@change_request.project)
  end

  private
    def set_change_request
      @change_request = ChangeRequest.find(params[:id])
    end
end
