Rails.application.routes.draw do

  devise_for :users, :controllers => { 
			:omniauth_callbacks => 'users/omniauth_callbacks'
	}, path: '', path_names: { 
		sign_in: 'signin', 
		sign_out: 'signout',
		sign_up: 'register'
	}

	resources :users do
	end

	resources :task_lists,    only: [:create, :update] do
    resources :tasks,					only: [:create, :update, :destroy]
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

	authenticated do
		root to: 'users#home', as: 'dashboard'
	end

	root to: 'static_pages#home'

  get 'help', to: 'static_pages#help'
	get 'about', to: 'static_pages#about'

	#devise_scope :user do
		#get 'sign_out', :to => 'devise/sessions#destory', :as => :destroy_user_session
	#end

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
