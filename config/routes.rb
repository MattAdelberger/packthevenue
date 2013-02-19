Packthevenue::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :payments, :only => [:new, :create]

  resources :activities
  
  resources :users do
  member do
    get :follow
    get :unfollow
  end
end


  devise_for :accounts, :controllers => { :omniauth_callbacks => "accounts/omniauth_callbacks", :registrations => "registrations" } do
    get "sign_up" => "registrations#new", :as => :new_account
    get "account_settings" => "registrations#edit", :as => :account_settings
    get "log_in" => "devise/sessions#new", :as => :log_in
    get "log_out" => "devise/sessions#destroy", :as => :log_out
    get "new_password" => "devise/passwords#new"
  end
  
  root :to => "pages#splash"
  
  #activities 
  
  match "guest_list" => "activities#guest_list", :as => :guest_list
  
  #payments
  
  match "make_payment" => "payments#make_payment", :as => :make_payment
  
  match "confirmation" => "payments#confirmation", :as => :confirmation
  
  #PAGES
  
  #match "dashboard" => "users#dashboard", :as => :dashboard
  
  match "home" => "pages#landing", :as => :landing
  
  match "how_it_works" => "pages#how_it_works", :as => :how_it_works
  
  match "jobs" => "pages#jobs", :as => :jobs
  
  match "about" => "pages#about", :as => :about
  
  match "privacy_policy" => "pages#privacy_policy", :as => :privacy_policy
  
  match "terms_and_conditions" => "pages#terms_conditions", :as => :terms_and_conditions
  
  match "pricing" => "pages#pricing", :as => :pricing
  
  match "profile" => "users#profile", :as => :profile
  
  match "splash" => "pages#splash", :as => :welcome
  
  #search
  
  match "search" => "application#header_search", :as => :search, :via => :get
 
  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
