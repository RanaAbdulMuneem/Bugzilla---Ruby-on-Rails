class Manager::ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy add_developer remove_developer add_qa remove_qa]
  before_action :authenticate_user!

  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to manager_project_path(@project), notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @developers = @project.developers
    @qas = @project.quality_assurances
    @change_requests = @project.change_requests
  end

  def edit
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to manager_project_path(@project), notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to manager_projects_path, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def add_developer
    developer = Developer.find(params.require(:developer).permit(:user_id)[:user_id])
    @project.developers << developer unless @project.developers.include? developer
    redirect_to manager_project_path(@project)
  end

  def remove_developer
    developer = Developer.find(params[:user_id])
    @project.developers.delete(developer)
    redirect_to manager_project_path(@project)
  end

  def add_qa
    qa = QualityAssurance.find(params.require(:qa).permit(:user_id)[:user_id])
    @project.quality_assurances << qa unless @project.quality_assurances.include? qa
    redirect_to manager_project_path(@project)
  end

  def remove_qa
    qa = QualityAssurance.find(params[:user_id])
    @project.quality_assurances.delete(qa)
    redirect_to manager_project_path(@project)
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :user_id)
    end
end
