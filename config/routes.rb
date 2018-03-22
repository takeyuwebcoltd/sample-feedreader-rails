Rails.application.routes.draw do
  resources :channels, only: [:index, :new, :create] do
    get 'fetch_items'
  end
end
