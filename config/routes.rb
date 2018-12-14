Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "/", to: "home#index"
      post "/instructions", to: "home#instructions"
      post "/probe/reset", to: "probe#reset"
      post "/probe/moviments", to: "probe#moviments"
      post "/probe/position", to: "probe#position"
    end
  end

  post "*path", to: "api/v1/home#not_found"
  post "/", to: "api/v1/home#index"
  get "*path", to: "api/v1/home#not_found"
  get "/", to: "api/v1/home#index"
end
