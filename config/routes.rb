Rails.application.routes.draw do
  
  

  match '*path', via: [:options], to: lambda {|_| [204, { 'Content-Type' => 'text/plain' }]}


  #devise_for :users
  devise_for :users, controllers: { sessions: "users/sessions" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  #match '/articles',      to: 'articles#new',           via: 'get'
  get '/robots.:format' => 'pages#robots', defaults: { format: 'text' }
  get "(:keyword)" => "articles#index", :constraints => lambda { |request| request.params[:keyword] && request.params[:keyword] != "" && request.params[:keyword] != "articles"}
  #get "/find/all" => "articles#list", :constraints => lambda { |request| request.params[:keyword] && request.params[:keyword] != ""}
  
  get 'find/all' => 'lookups#new'
  get 'chats/demo' => 'chats#demo'
  
  
  #get 'lookups/review' => 'lookups#review'
  get 'letters/review' => 'letters#review'
  get 'feedbacks/new' => 'feedbacks/new'
  post 'letters/sender' => 'letters#sender'
  root 'engages#now'
  get '/sitemap.xml.gz' => 'sitemaps#show'
  
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
  resources :engages, :letters, :feedbacks
  
  resources :articles do
    resources :comments
  end

end
