# Rails.application.routes.draw do
#   root to: 'application#index'
  
#   resources :meals
#   resources :users do
#     member do
#       put 'add_meal', as: :add_meal_to
#     end
#   end  
#   resources :foods

#   get 'sessions/new' => 'sessions#new'
#   post 'sessions' => 'sessions#create'
#   delete 'sessions' => 'sessions#destroy'
# end

Rails.application.routes.draw do
  root to: 'application#index'
  
  resources :meals do
    member do
      post 'add_food', as: :add_food_to
      get 'add_food', from: :add_food_to
    end 
  end 
  resources :users do
    member do
      post 'add_meal', as: :add_meal_to
      get 'add_meal', from: :add_meal_to
    end
  end  
  resources :foods

  get 'sessions/new' => 'sessions#new'
  get 'sessions/current_user' => 'sessions#current_user'
  post 'sessions' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy'
end

  






































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
