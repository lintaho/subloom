Subloom::Application.routes.draw do


  devise_for :users, :controllers => { :registrations => "registrations" }
  match '/users/:id/following', :to => 'users#following', via: 'get', as: 'following_users'
  match '/users/:id/followers', :to => 'users#followers', via: 'get', as: 'followers_users'
  # match '/users/:id/', :to => 'users#show', via: 'get'
  root :to => "pages#index"



  resources :links
  resources :votes, only: [:create, :destroy]
  resources :profiles
  resources :follow_relationships, only: [:create, :destroy]
  resources :save_relationships, only: [:create, :destroy]
  get '/photographer/:id' => 'profiles#show_photog', as: 'photographer'
  get '/photographers/' => 'users#photogs_index', as: "photogs_index"


  get 'search' => 'search#index'

  match '/about', to: 'pages#about', via:'get'
  match '/contact', to: 'pages#contact', via:'get'
 #  resources :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
