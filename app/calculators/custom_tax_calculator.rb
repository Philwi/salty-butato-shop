class CustomTaxCalculator < Spree::ShippingCalculator
  def self.description
    'makes a post request to printful to get the actual tax costs'
  end

  def compute_line_item(item)
    result = ::Printful::TaxRate::Operation::GetRate.(order: item.order)
    tax_rate = result['tax_rate']
    tax_rate * item.cost_price
  end
end
