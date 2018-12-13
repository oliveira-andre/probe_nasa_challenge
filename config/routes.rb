Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "/", to: "home#index"
      post "/instructions", to: "home#instructions"
    end
  end

  post "*path", to: "api/v1/home#index"
  post "/", to: "api/v1/home#index"
  get "*path", to: "api/v1/home#index"
  get "/", to: "api/v1/home#index"
end
