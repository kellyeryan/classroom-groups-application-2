Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root "pages#my_classrooms", as: :authenticated_root
  end
  root 'pages#home'
end
