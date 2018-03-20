Rails.application.routes.draw do
  resources :channels, only: [:index, :new, :create]
end
