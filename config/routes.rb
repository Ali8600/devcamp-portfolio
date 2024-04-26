Rails.application.routes.draw do

  # User authentication routes
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  # Routes for portfolios
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'cricket-tips-portfolios', to: 'portfolios#crickettipsshow'



  # Other routes
  get 'abouts', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  # Routes for home
  get 'home/about/aboutme', to: 'home#about'
  get 'home/contact'

  # Root route
  root to: 'pages#about'
  # Routes for blogs
  get 'blogs', to: 'blogs#index'
  get 'blog/:id', to: 'blogs#show', as: 'blog_show'
  get 'blogs/new', to: 'blogs#new', as: 'new_blog'
  get 'blog/:id/edit', to: 'blogs#edit', as: 'edit_blog'
  post 'blogs', to: 'blogs#create'
  patch 'blog/:id', to: 'blogs#update', as: 'blog'
  delete 'blog/:id', to: 'blogs#destroy', as: 'destroy_blog'
end

# resources :blogs do
#   member do
#     get :toggle_status
#   end
# end
# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# Defines the root path route ("/")
# root "articles#index"