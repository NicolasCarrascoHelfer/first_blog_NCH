Rails.application.routes.draw do
  authenticated :user, ->(user) { user.admin? } do
    get "admin", to: "admin#index"
    get "admin/posts"
    get "admin/comments"
    get "admin/users"
    get "admin/show_post/:id", to: "admin#show_post", as: "admin_post"
  end
  get "search", to: "search#index", via: [:get, :post]
  get "users/profile"
  devise_for :users, controllers: {
                       sessions: "users/sessions",
                       registrations: "users/registrations",
                     }
  get "/u/:id", to: "users#profile", as: "user"

  resources :posts do
    resources :comments
  end

  get "about", to: "pages#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
end
