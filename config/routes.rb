Rails.application.routes.draw do
  devise_for :user, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions",
  }

  namespace :public do
    resources :users, only: [:show, :edit, :update]
    resources :books do
      resources :comments, only: [:create, :index, :destroy]
      resource :favorites, only: [:create, :destroy]
      #いいね機能
    end
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root :to =>"homes#top"
    resources :books, only: [:index]
  end

  root to: "homes#top"
  get "/about" => 'homes#about', as: 'about'

end
