Rails.application.routes.draw do
  resources :courses
  resources :students, except: :destroy
  resource :session, only: [:create, :destroy, :new]
  resources :users, only: [:create, :new, :edit]

  root to: redirect("/courses")
end
