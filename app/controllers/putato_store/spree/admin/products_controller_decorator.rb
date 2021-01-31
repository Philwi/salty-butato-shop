module PutatoStore::Spree::Admin
  module ProductsControllerDecorator
    def sync_new_products_from_printful
      ::ProductsJob.perform_now
      flash[:notice] = 'Die Produkte werden aus Printful synchronisiert. Das kann ein bisschen dauern!'
      redirect_to admin_products_path
    end
  end
end

::Spree::Admin::ProductsController.prepend ::PutatoStore::Spree::Admin::ProductsControllerDecorator if ::Spree::Admin::ProductsController.included_modules.exclude?(PutatoStore::Spree::Admin::ProductsControllerDecorator)
