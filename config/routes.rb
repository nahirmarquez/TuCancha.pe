#ActionController::Routing::Routes.draw do |map|
#map.resources :local_deportivos
#map.resources :index
#map.root :controller => "local_deportivos";
#map.connect ':controller/:action/:id'
#map.connect ':controller/:action/:id.:format'


SpikeSolution::Application.routes.draw do 

  
resources :reservas
match "/findbyfecha" => "reservas#findbyfecha", :as => :findbyfecha
match "/verMisReservas" => "reservas#ver_mis_reservas", :as => :vermisreservas
match "/buscarDisponibilidad" => "reservas#buscar",:as => :buscarDisponibilidad
match "/procesarBusqueda" => "reservas#procesarBusqueda",:as => :procesarBusqueda
match "/verCalendarioReservas" =>"reservas#verCalendarioReservas",:as => :verCalendarioReservas

match "/login" => "sesiones#new", :as => "login"
match "/sesiones" => "sesiones#create", :as => "sesion"

#match '/auth/:provider/callback', to: 'sessions#create'
match "/auth/:provider/callback" => "authentication#create"

match '/auth/failure', to: redirect('/')

#match '/signout', to: 'sessions#destroy', as: 'signout'
match "/signout" => "authentication#destroy", :as => :signout

match "/salir" => "sesiones#destroy", :as => :salir


resources :evento_deportivos

resources :espacio_deportivos
match "/findbylocal" => "espacio_deportivos#findbylocal", :as => :findbylocal

resources :local_deportivos
match "/verSolicitudes" => "local_deportivos#ver_solicitudes", :as => :versolicitudes
match "/editarSolicitud" => "local_deportivos#editar_solicitud", :as => :editarsolicitud
match "/confirmarSolicitud" => "local_deportivos#confirmar_solicitud", :as => :confirmarsolicitud
match "/rechazarSolicitud" => "local_deportivos#rechazar_solicitud", :as => :rechazarsolicitud
match "/verMisLocales" => "local_deportivos#ver_mis_locales", :as => :vermislocales

match "/busqueda" => "local_deportivos#busqueda", :as => :busqueda

root :to => 'local_deportivos#home'

resources :usuarios


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
#  root :to => 'home#index'
#map.root :controller => "local_deportivos"
#map.root :controller => "local_deportivos" 

#map.root '/', :controller => 'local_deportivos', :action => 'index'

# See how all your routes lay out with "rake routes"

# This is a legacy wild controller route that's not recommended for RESTful applications.
# Note: This route will make all actions in every controller accessible via GET requests.
# match ':controller(/:action(/:id))(.:format)'
end
