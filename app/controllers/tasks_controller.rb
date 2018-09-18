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
    id = params[:id]
    @task = Task.find_by(id: id )
  end

end
