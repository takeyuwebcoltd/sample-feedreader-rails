Rails.application.routes.draw do
  resources :channels do
    get 'fetch_items'
  end
end
