Rails.application.routes.draw do
  resources :feeds, only:[:index, :new, :create]
end
