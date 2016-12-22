Rails.application.routes.draw do
  devise_for  :users, :controllers => { registrations: 'registrations' }

  namespace :chef do
    resources :menus
  end

  namespace :customer do
    resources :menus, only: [:index, :show] do
      resources :orders
    end
  end

  resources   :users do
    resources :orders
  end

  resources   :menu_items

  authenticated :user do
    root 'users#current_user_home', as: :authenticated_root
  end
  root to: 'application#landing_page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
