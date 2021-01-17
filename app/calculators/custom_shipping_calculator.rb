class CustomShippingCalculator < Spree::ShippingCalculator
  def self.description
    'makes a post request to printful to get the actual shipping costs'
  end

  def compute_package(package)
    result = ::Printful::ShippingRate::Operation::GetCosts.(order: package.order)
    if costs = result[:costs]
      costs
    else
      10
    end
  end
end
