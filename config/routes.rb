Rails.application.routes.draw do
  get "about", to: "about#index"

  get "sign_up", to: "registrations#new"
  get "sign_up", to: "registrations#create"

  root to: "main#index"
end
