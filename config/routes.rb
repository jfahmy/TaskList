Rails.application.routes.draw do
  root "tasks#index"
  resources :tasks
  # #route for index of all tasks
  # get '/tasks', to: "tasks#index", as: "tasks"
  #
  # #routes to create new task
  # get '/tasks/new', to: "tasks#new", as: "new_task"
  # post '/tasks', to: "tasks#create"
  #
  # #route to show a single task
  # get '/tasks/:id', to: "tasks#show", as: "task"
  #
  # #routs for updating a single task
  # get '/tasks/:id/edit', to: "tasks#edit", as: "edit_task"
  # patch '/tasks/:id', to: "tasks#update"
  #
  # delete '/tasks/:id', to: "tasks#destroy", as: "delete_task"
  patch '/tasks/:id/complete', to: "tasks#strikethrough", as: "strikethrough_task"
  patch '/tasks/:id/incomplete', to: "tasks#strikethrough", as: "normalize_task"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
