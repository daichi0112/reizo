Rails.application.routes.draw do
  devise_for :users
  root to: 'foods#index'
  resources :foods, except: :show do
    collection do
      get 'search'
    end
  end
end
