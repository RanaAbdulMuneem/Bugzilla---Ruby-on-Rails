class QualityAssurance::ChangeRequestsController < ApplicationController
  before_action :set_project, only: %i[new create]

  def show
  end

  def new
    @change_request = ChangeRequest.new
  end

  def create
    @change_request = ChangeRequest.new(request_params)
    @change_request.save
    #redirect_to quality_assurance_project_path(@project)


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
  def request_params
    params.require(:change_request).permit(:title, :deadline, :screen_shot, :type, :status, :user_id, :project_id)
  end
end
