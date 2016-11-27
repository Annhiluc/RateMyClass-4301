Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'student/list'
  get 'student/new'
  post 'student/create'
  patch 'student/update'
  get 'student/list'
  get 'student/show'
  get 'student/edit'
  get 'student/delete'
  get 'student/update'
  post 'dashboard/search_professor'
  post 'dashboard/search_course'
  get 'dashboard/show_professor'
  get 'dashboard/show_course'
  
  get '/', to: 'dashboard#index'
  get '/sign-up', to: 'student#new'
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
