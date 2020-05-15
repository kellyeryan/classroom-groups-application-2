Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root "pages#my_classrooms", as: :authenticated_root
  end
  root 'pages#home'
  resources :classrooms, only: [:index, :show, :create, :update, :destroy] do
    resources :students, only: [:index, :show, :create, :update, :destroy]
  end
end
