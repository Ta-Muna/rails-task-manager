class TasksController < ApplicationController
  # before_action :set_task, only: [:show, :edit, :update, :destroy] # call the set_task before starting any action

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

  def destroy
    @task = Task.find(params[:id]) # no need! As I have a before_action
    @task.destroy # Active Record
    redirect_to tasks_path, status: :see_other # as we don't redirect to the instance we were handling
  end

private

def task_params
  params.required(:task).permit(:title, :details, :completed)
end

# def set_task
#   @task= Task.find(params[:id])
# end

end
