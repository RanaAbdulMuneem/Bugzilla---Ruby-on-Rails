class Developer::ChangeRequestsController < ApplicationController
  def show
  end

  def assign
    change = ChangeRequest.find(params[:id])
    dev = Developer.find(current_user.id)
    change.developers << dev unless change.developers.include? dev
    redirect_to developer_project_path(change.project)
  end
end
