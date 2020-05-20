Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root "classrooms#index", as: :authenticated_root
  end
  root 'pages#home'
  resources :classrooms do
    resources :students
  end
end
