VolkovaPortfolio::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  namespace :api do
    resources :translations do
      collection do
        get :reload
      end
    end
  end

  scope "(:locale)", :locale => /ru|en/ do
    scope module: :web do
      root to: "welcome#index"

      resources :pages, only: [ :show ]
      resource :session, only: [ :new, :create, :destroy ]
      resources :questions, only: [ :new, :create ]
      resources :projects, only: [:index, :show]
      resources :photos, only: [:index]
      resource :biography, only: [:show]

      namespace :admin do
        root to: "welcome#index"

        resources :translations
        resources :users
        resource :main_page, only: [:edit, :update]
        resource :biography, only: [:edit, :update]
        resources :pages
        resources :questions
        resources :projects
      end
    end
  end
end
