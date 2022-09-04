Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "public/sessions",
    registrations: "public/registrations"
  }
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  get 'homes/top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
