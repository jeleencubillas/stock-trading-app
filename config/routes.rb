Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/pages/:page" => "pages#show"
  root "pages#show", page: "home"

  resources :users, only: [:index, :update, :edit]

  devise_for :admins,
    path: "admins",
    controllers: { 
      confirmations: "admins/confirmations",
      mailer: "admins/mailer",
      passwords: "admins/passwords",
      sessions: "admins/sessions",
      shared: "admins/shared",
      unlocks: "admins/unlocks"
    }

  devise_for :users,
    path: "",
    path_names: {
      sign_in: "login",
      sign_out: "logout",
      sign_up: "register"
    },
    controllers: { 
      confirmations: "users/confirmations",
      mailer: "users/mailer",
      passwords: "users/passwords",
      registrations: "users/registrations",
      sessions: "users/sessions",
      shared: "users/shared",
      unlocks: "users/unlocks"
    }

end
