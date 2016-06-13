Rails.application.routes.draw do
 
  devise_for :users, controllers: {sessions: "users/sessions"}
    devise_scope :user do
  end
  
  get '/admin' => 'admin/data_items#index'
  
  namespace :admin do
    resources :artists
    resources :members

    resources :data_items do
      resources :content_items do
        resources :content_resources
      end
    end    
  end 
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  
  # get '/admin/data_items' => 'admin/data_items#index'
  # get '/admin/data_items/new' => 'admin/data_items#new'
  # get '/admin/data_items/:id(.:format)/edit' => 'admin/data_items#edit'
  # get '/admin/data_items/:id(.:format)' => 'admin/data_items#show'
  # delete '/admin/data_items/:id(.:format)' => 'admin/data_items#destroy'
  
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

  root'artists#index'
end
