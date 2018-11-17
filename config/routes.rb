Rails.application.routes.draw do
  resources :grades
  resources :studentdata
  resources :students
  resources :classrooms
  resources :schools
  resources :schooldistricts

  devise_for :users

  namespace :admin do
    resources :users
    resources :plans

    root to: "users#index"
  end

  get 'static_pages/home'
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'

  get '/students/:id/studentdatum', to: 'students#add_data_student', as: 'add_data_to_student'
  put '/students/:id/toggle', to: 'students#toggle', as: 'toggle_student'
  put '/classrooms/:id/archive', to: 'classrooms#archive', as: 'archive'
  get '/classrooms/:id/studentdatum', to: 'classrooms#add_data_classroom', as: 'add_data_to_classroom'
  post '/students/:id/studentdatum', to: 'students#studentdatum', as: 'post_data_to_student'
  post '/classroom/:id/studentdatum', to: 'classrooms#studentdatum', as: 'post_data_to_classroom'

  get '/dashboard/teachers', to: 'dashboard#teachers', as: 'teachers_dashboard'  
  post '/dashboard/grades', to: 'dashboard#set_grades', as: 'set_grades'
  
  authenticated do
    root :to => 'dashboard#index', as: :authenticated
  end

  root to: "static_pages#home"
end
