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
end
