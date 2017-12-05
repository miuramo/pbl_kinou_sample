Rails.application.routes.draw do
  resources :captures
  resources :urls
  resources :users do
      resources :urls
  end
  get 'users/:user_id/captall', to: 'users#captall'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
