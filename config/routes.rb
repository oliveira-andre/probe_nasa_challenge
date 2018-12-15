Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "/", to: "home#index", as: "home"
      post "/instructions", to: "home#instructions", as: "instructions"
      post "/probe/reset", to: "probe#reset", as: "reset"
      post "/probe/moviments", to: "probe#moviments", as: "moviments"
      post "/probe/position", to: "probe#position", as: "position"
    end
  end

  post "*path", to: "api/v1/home#not_found", as: "not_found_any_post"
  post "/", to: "api/v1/home#not_found", as: "not_found_home_post"
  get "*path", to: "api/v1/home#not_found", as: "not_found_any_get"
  get "/", to: "api/v1/home#not_found", as: "not_found_home_get"
end
