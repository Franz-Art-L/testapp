Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post "/users", to: "users#create"

  post "/posts", to: "posts#create"
  
  get "/posts", to: "posts#list_all"
end
