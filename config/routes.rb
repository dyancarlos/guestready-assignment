Rails.application.routes.draw do
  root "rentals#index"

  resources :rentals do
    collection do
      get :search
    end
  end
end
