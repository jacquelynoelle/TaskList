Rails.application.routes.draw do
  root "tasks#index"
  resources :tasks
  # # WITHOUT RESOURCES:
  # get '/tasks', to: 'tasks#index', as: 'tasks'
  #
  # get '/tasks/new', to: 'tasks#new', as: 'new_task'
  #
  # post '/tasks', to: 'tasks#create'
  #
  # get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  #
  # # this has to be below /tasks/new so rails doesn't stop here first when it sees /tasks/new
  # get '/tasks/:id', to: 'tasks#show', as: 'task'
  #
  # patch '/tasks/:id', to: 'tasks#update'
  # # put '/tasks/:name', to: 'tasks#update' # use put only if replacing all fields
  #
  # delete '/tasks/:id', to: 'tasks#destroy', as: 'delete_task'
  #
  patch '/tasks/:id/complete', to: 'tasks#complete', as: 'mark_task_complete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
