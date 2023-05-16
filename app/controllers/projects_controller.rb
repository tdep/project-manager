class ProjectsController < ApplicationController

  def index
    render json: Project.all, status: 200
  end

  def show
    project = Project.find_by!(id: params[:id])
    render json: project
  end

  def create
    project = Project.create!(
      title: params[:title],
      description: params[:description]
    )
    render json: project
  end

  def update
    project = Project.find_by!(id: params[:id])
    project.update(title: params[:title])
    project.update(description: params[:description])
    render json: project
  end

  def destroy
    project = Project.find_by!(id: params[:id])
    project.destroy
    render json: project
  end
end
