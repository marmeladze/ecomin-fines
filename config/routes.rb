Rails.application.routes.draw do
  

  root 'statistics#index'
  
  resources :statistics, only: [:index, :show], param: :slug, path: 'rayonlara-gore-statistikalar'
  
  get 'statistics', to: redirect('rayonlara-gore-statistikalar')
  get 'statistics/:slug', to: redirect('/rayonlara-gore-statistikalar/%{slug}')
  
  get 'admin' => 'admin/base#index'
  get 'load_forestries' => 'admin/base#load_forestries'
  get 'search' => 'admin/base#search'

  post 'create-report' => 'admin/base#create_report'
  get  'load-report/:verbatim' => 'admin/base#load_report', as: :load_report

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  namespace :admin do
    resources :users do 
      put "remove", on: :member
    end
    resources :quarters
    resources :regions
    resources :trees
    resources :compensation_rates
    resources :height_ranges
    resources :forestries
    resources :classifications
    resources :detours
    resources :material_volumes
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
end
