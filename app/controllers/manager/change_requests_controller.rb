class Manager::ChangeRequestsController < ApplicationController
  before_action :set_change_request, only: %i[show]

  def show
  end

  private
    def set_change_request
      @change_request = ChangeRequest.find(params[:id])
    end
end
