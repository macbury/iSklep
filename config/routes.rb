ActionController::Routing::Routes.draw do |map|
  
  map.connect '/produkt/:permalink', :controller => 'sklep', :action => 'show' 
  
  map.with_options :controller => 'sklep', :action => 'index' do |sklep|
    sklep.connect '/produkty'
    sklep.connect '/kategoria/:kategoria/:sub_kategoria', :sub_kategoria => nil, :kategoria => nil
    sklep.connect '/producent/:producent'
  end
  
  map.with_options :path_prefix => '/admin'  do |admin|
    admin.resources :produkty, :collection => { :preview => :post }
    admin.resources :kategorie
    admin.resources :producenci
    admin.ustawienia '/ustawienia', :controller => 'ustawienia'
  end
  
  map.connect '/admin', :controller => 'produkty'
  
  map.with_options :controller => 'sessions' do |uzytkownik|
    uzytkownik.logout '/logout', :action => 'destroy'
    uzytkownik.login '/login', :action => 'new'
  end
  
  map.with_options :controller => 'uzytkownicy' do |uzytkownik|
    uzytkownik.register '/register', :action => 'create'
    uzytkownik.signup '/signup', :action => 'new'
    uzytkownik.activate '/activate/:activation_code', :action => 'activate'
  end
  
  map.resources :uzytkownicy, :member => { :complete => :get }
  
  map.resource :session

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  #map.connect ':kategoria/:sub_kateogria/:produkt', 
  map.root :controller => 'sklep'

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
