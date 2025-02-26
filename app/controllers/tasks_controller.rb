class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  # receive the users inputs for a new task, create the instance and save it
  def create
    @task = Task.create(task_params)
    # redirect_to "tasks/#{@task.id}" # redirec to the show page
    redirect_to task_path(@task.id) # path method generate the url for you based on the alias
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params) # updates with the new info
    redirect_to task_path(@task) # path method generate the url based on the alias
  end

private

def task_params
  params.required(:task).permit(:title, :details)
end
end
