Rails.application.routes.draw do
  comfy_route :cms_admin, path: "/cms"
  # Ensure that this route is defined last
  comfy_route :cms, path: "/blog"

  root 'spree/home#index'

  # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to
  # Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the
  # :at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being
  # the default of "spree".
    mount Spree::Core::Engine, at: '/'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Spree::Core::Engine.add_routes do
  namespace :admin, path: Spree.admin_path do
    post 'products/get_new_products_from_printful', to: 'products#sync_new_products_from_printful'
  end
end
