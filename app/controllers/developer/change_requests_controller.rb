class Developer::ChangeRequestsController < ApplicationController
  before_action :set_change_request, only: %i[show assign update]

  def show
  end

  def assign
    dev = Developer.find(current_user.id)
    @change.developers << dev unless @change.developers.include? dev
    @change.update(status: 'started')
    redirect_to developer_project_path(@change.project)
  end

  def update
    if (@change.type == 'Bug')
      @change.update(status: 'resolved')
    else
      @change.update(status: 'completed')
    end
    redirect_to developer_project_path(@change.project)
  end

  private
    def set_change_request
      @change = ChangeRequest.find(params[:id])
    end
end
