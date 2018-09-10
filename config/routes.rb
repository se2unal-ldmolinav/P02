Rails.application.routes.draw do
  
  resources :authors do
    resources :books
  end  
  #para obtener todas las peticiones
  #resources :authors, only: [:destroy, :create]
  #with_options only: [:destroy, :create] do |list_only|
  #    list_only.resources :books
  #    list_only.resources :authors 
  #end  
  
  #resources :comments, constraints: {subdomain: 'api'}
end
