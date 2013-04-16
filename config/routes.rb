VolkovaPortfolio::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  scope module: :web do
    root to: "welcome#index"

    resources :pages, only: [ :show ]
    resource :session, only: [ :new, :create, :destroy ]
    resources :questions, only: [ :new, :create ]
    namespace :admin do
      root to: "welcome#index"

      resources :users
      resources :pages
      resources :questions
    end
  end
end
