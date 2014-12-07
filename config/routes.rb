Rails.application.routes.draw do

  get 'welcome/index'
  post 'welcome/index' => 'welcome#create_new_order'

  get 'customers/index'
  get 'customers/delete'
  post 'customers/index' => 'customers#create'

  get 'materials/index'
  get 'materials/delete'
  post 'materials/index' => 'materials#create'

  get 'items/index'
  get 'items/delete'
  post 'items/index' => 'items#create'

  get 'orders/index'
  get 'orders/delete'
  post 'orders/index' => 'orders#create'

  get 'productions/index'
  get 'productions/delete'
  post 'productions/index' => 'productions#create'

  get 'promotions/index'
  get 'promotions/delete'
  post 'promotions/index' => 'promotions#create'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
