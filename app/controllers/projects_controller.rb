class ProjectsController < ApplicationController
  def index
  	@projects = Project.all
  end
  def new
  	@project = Project.new
  end
  def create 
  	@project = Project.new(project_params)
  	if @project.save
  		redirect_to @project
  	else
  		render 'new'
  	end

  end
    def show
	@project = Project.find(params[:id])  	
  end
def edit
	@project = Project.find(params[:id])
end
def update
	@project = Project.find(params[:id])
	if @project.update(params[:project].permit(:title, :text, :genre, :rating, :language, :image))
		redirect_to @project
		else
			render 'edit'
		end
	end

  private
  def project_params
  	params.require(:project).permit(:title, :text, :genre, :rating, :language, :image)
  	
  end


end