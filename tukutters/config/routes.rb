Rails.application.routes.draw do
  resources :tukutters do
    collection do
      post :confirm
    end
  end
end
