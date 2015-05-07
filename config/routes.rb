Rails.application.routes.draw do

  namespace :api do
    resources :job_orders, defaults: {format: :json}
    resources :shifts, defaults: {format: :json}
  end
  
  resources :agency_profiles do
    member do
      patch :add_user
    end
  end
  get    'job_orders'    => 'job_orders#search'
  resources :job_orders do
    collection { post :search, to: 'job_orders#search' }
  end

  resources :timesheets do
    member do
      patch :approve
    end
  end

  resources :assignments do
    resources :shifts do
      member do
        patch :clock_in
        patch :clock_out
      end
    end  
  end
  


  # resources :job_orders

  root                'static_pages#home'
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'dashboard' => 'static_pages#dashboard'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users do
    member do
    patch :make_admin
    end
  end

  
  
  resources :company_profiles do
    resources :job_orders
    member do
      patch :assign_admin
    end
  end
  resources :employee_profiles do
    resources :users, module: :employee_profiles
  end
  # resources :companies do
  #   resources :company_profiles
  # end
  # resources :employees do
  #   resources :employee_profiles
  # end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

# end













#   # Example of regular route:
#   #   get 'products/:id' => 'catalog#view'

#   # Example of named route that can be invoked with purchase_url(id: product.id)
#   #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

#   # Example resource route (maps HTTP verbs to controller actions automatically):
#   #   resources :products

#   # Example resource route with options:
#   #   resources :products do
#   #     member do
#   #       get 'short'
#   #       post 'toggle'
#   #     end
#   #
#   #     collection do
#   #       get 'sold'
#   #     end
#   #   end

#   # Example resource route with sub-resources:
#   #   resources :products do
#   #     resources :comments, :sales
#   #     resource :seller
#   #   end

#   # Example resource route with more complex sub-resources:
#   #   resources :products do
#   #     resources :comments
#   #     resources :sales do
#   #       get 'recent', on: :collection
#   #     end
#   #   end

#   # Example resource route with concerns:
#   #   concern :toggleable do
#   #     post 'toggle'
#   #   end
#   #   resources :posts, concerns: :toggleable
#   #   resources :photos, concerns: :toggleable

#   # Example resource route within a namespace:
#   #   namespace :admin do
#   #     # Directs /admin/products/* to Admin::ProductsController
#   #     # (app/controllers/admin/products_controller.rb)
#   #     resources :products
#   #   end

end