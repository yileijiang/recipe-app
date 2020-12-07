Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "recipes#index"
 
  resources :recipes do
    collection do 
      get :filter
    end
  end

  resources :tags, only: [:new, :create, :destroy]
  resources :ingredients, only: [:new, :create]

end
