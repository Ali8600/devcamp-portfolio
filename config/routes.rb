Rails.application.routes.draw do
  #routes for portfolios
  resources :portfolios, except: [:show]
   get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
     get 'cricket-tips-portfolios', to: 'portfolios#crickettipsshow'
  #get 'pages/home'
  root to: 'pages#home'
  get 'abouts', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  #routes for home
  get 'home/about/aboutme', to: 'home#about'
  get 'home/contact'

  #routes for blogs
  get 'blogs', to: 'blogs#index'
  get 'blog/:id', to: 'blogs#show', as: 'blog_show'
  get 'blogs/new', to: 'blogs#new', as: 'new_blog'
  get 'blog/:id/edit', to: 'blogs#edit', as: 'edit_blog'
  post 'blogs', to: 'blogs#create'
  patch 'blog/:id', to: 'blogs#update', as: 'blog'
  delete 'blog/:id', to: 'blogs#destroy', as: 'destroy_blog'


  # resources :blogs do
  #   member do
  #     get :toggle_status
  #   end
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
