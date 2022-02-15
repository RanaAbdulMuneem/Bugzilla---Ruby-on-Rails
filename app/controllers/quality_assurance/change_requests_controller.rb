class QualityAssurance::ChangeRequestsController < ApplicationController
  before_action :set_project, only: %i[new create]
  before_action :set_change_request, only: %i[show]

  def show
    @project = Project.find_by(id: @change_request.project_id)
    @qa = QualityAssurance.find_by(id: @change_request.user_id)
    @developers = @change_request.developers
  end

  def new
    @change_request = ChangeRequest.new
  end

  def create
    @change_request = ChangeRequest.new(request_params)
    @change_request.save

    respond_to do |format|
      if @change_request.save
        format.html { redirect_to quality_assurance_project_path(@project), notice: "Request was successfully posted." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @change_request.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_project
    @project = Project.find(params[:project_id])
  end
  def set_change_request
    @change_request = ChangeRequest.find(params[:id])
  end
  def request_params
    params.require(:change_request).permit(:title, :deadline, :screen_shot, :type, :status, :user_id, :project_id)
  end
end
