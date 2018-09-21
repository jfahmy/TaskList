# TASKS = [
#   { id: 1, name: "Chug Water", description: "Everyone must hydrate!!!", completion_time: "6:00am"},
#   { id: 2, name: "Stretch", description: "Get flexy and stretchy for a bit, preferably with a back round tune.", completion_time: "6:15am"},
#   { id: 3, name: "Meditate", description: "Grab those mala beads and recite some affirmations. Or, at least keep your eyes closed and breath.", completion_time: "6:30am"},
#   { id: 4, name: "Read Grokking Algorithms", description: "Put in 20 minutes with the Grokking book. Sketch out solutions in your notebook.", completion_time: "6:55am"}
# ]

class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(:completion_time)
  end

  def show
    @task = Task.find(params[:id].to_i)

    if @task.nil?
      render :notfound, status: :not_found
    end
  end

  def create
    @task = Task.new(name: params[:task][:name], description: params[:task][:description], completion_time: params[:task][:completion_time])
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
    @task = Task.find(params[:id].to_i)
    @task.name = params[:task][:name]
    @task.description = params[:task][:description]
    @task.completion_time = params[:task][:completion_time]
    @task.save
    redirect_to task_path
  end

  def destroy
    task = Task.find(params[:id].to_i)
    @deleted_task = task.destroy

  end

end
