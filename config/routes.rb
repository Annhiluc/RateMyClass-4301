Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'home#list'
  get '/home', to: 'home#list'
  get '/sign-up', to: 'sign_up#sign_up'
  get '/class', to: 'class_profile#class_profile'
  get '/dashboard', to: 'dashboard#dashboard'
  get '/department', to: 'department_profile#department_profile'
  get '/professor', to: 'professor_profile#professor_profile'
  get '/review-class', to: 'review_class#review_class'
  get '/review-professor', to: 'review_professor#review_professor'
  get '/profile', to: 'user_profile#user_profile'
  get '/login', to: 'login#login'

  get 'home/list'
  get 'home/new'
  post 'home/create'
  patch 'home/update'
  get 'home/list'
  get 'home/show'
  get 'home/edit'
  get 'home/delete'
  get 'home/update'
end
