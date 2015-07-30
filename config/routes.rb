Rails.application.routes.draw do

  get 'leads/index'

  get 'homepage/index'

  resources :item_wh_transacs

  resources :items do
    get 'details'
  end

  resources :warehouses do
    get 'details'
  end
  resources :workers do
    get 'details'
  end
  root 'vegam#index'
  get 'vegam/index'

  post 'vegam/signin'

  post 'vegam/signup'
  
  get 'admins/admin'
  get 'vegam/myaccount'
  
 
  post 'vegam/fbauth'
  get 'services/add'

  get 'services/update'

  get 'services/show'

  get 'cities/add'

  get 'cities/update'

  get 'cities/show'
  
  post 'cities/add'
  
  post 'services/add'
  get 'leads/showBody'
  get 'leads/showBody2'
  get 'leads/deleteMail'
  get 'vegam/signout'
  resources :location

  resources :workers
  
  post 'booking/create' => 'booking#booking'
  post 'booking/doBooking'=> 'booking#doBooking'  
  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
