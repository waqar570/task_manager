Rails.application.routes.draw do
  Rails.application.routes.draw do
    root "tasks#index"
    resources :tasks do
    devise_for :users
    end
  end
end
