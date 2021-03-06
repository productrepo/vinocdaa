Rails.application.routes.draw do
  devise_for :users
  
  get 'events/welcome' => 'events#welcome'
  post 'events/event_subscription' => 'events#event_subscription'
  post 'events/event_going' => 'events#event_going'
  resources :events
  
  root 'events#welcome'

  get 'states/:country', to: 'events#states'
  get 'cities/:state/:country', to: 'events#cities'
  get 'departments/:stream_id', to: 'events#departments'

  get 'get_event_results/:query', to: 'events#get_event_results'
  get '/collegeda_admins', to: 'admins#collegeda_admins'
  get '/collegeda_users', to: 'admins#collegeda_users'
  get '/collegeda_events_moderation', to: 'admins#collegeda_events_moderation'
  get '/admins/publish_event', to: 'admins#publish_event'
  get '/collegeda_events_subscriber', to: 'admins#events_subscriber'
  get '/collegeda_events_action', to: 'admins#events_action'
  get '/collegeda_hide_events', to: 'admins#hide_events'
  get '/campus_ambassador', to: 'events#campus_ambassador'

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
