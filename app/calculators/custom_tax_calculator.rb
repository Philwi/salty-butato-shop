class CustomTaxCalculator < Spree::ShippingCalculator
  def self.description
    'makes a post request to printful to get the actual tax costs'
  end

  def compute_line_item(item)
    result = ::Printful::TaxRate::Operation::GetRate.(order: item.order)
    if (tax_rate = result['tax_rate']).present?
      tax_rate * item.cost_price.to_f
    else
      item.cost_price.to_f / 1.19 * 0.19
    end
  end

  def compute_shipment(item)
    item.cost
  end

  def compute_shipping_rate(item)
    result = ::Printful::TaxRate::Operation::GetRate.(order: item.order)
    if (tax_rate = result['tax_rate']).present?
      tax_rate * item.cost.to_f
    else
      item.cost.to_f / 1.19 * 0.19
    end
  end
end
