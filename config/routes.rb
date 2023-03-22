Rails.application.routes.draw do
  root "tasks#index" 
    devise_for :users , :controllers => { registrations: "users/registrations",
     confirmations: "users/confirmations" , passwords: "users/passwords"}
     resources :users do
      resources :tasks
    end
end