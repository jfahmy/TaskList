require 'date'

class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(:completion_date)
  end

  def show
    id = params[:id].to_i
    @task = Task.find_by(id: id)

    if @task.nil?
      render :notfound, status: :not_found
    end
  end

  def create
    @task = Task.new(book_params)
    if @task.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id].to_i)
  end

  def update
    task = Task.find(params[:id].to_i)
    task.update(book_params)
    redirect_to task_path
  end

  def destroy
    task = Task.find(params[:id].to_i)
    @deleted_task = task.destroy

  end

  def strikethrough
    @task = Task.find(params[:id].to_i)
    if @task.complete == false
      @task.complete = true
      @task.completion_date = DateTime.now
    elsif @task.complete == true
      @task.complete = false
      @task.completion_date = nil
    end
    @task.save

    redirect_to root_path
  end

  private
    def book_params
      return params.require(:task).permit(:name, :description, :completion_date)
    end

end
