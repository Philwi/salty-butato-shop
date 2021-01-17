class ProductsJob < ApplicationJob
  include ActiveJob::Retry.new(
    strategy: :variable,
    delays: [30.seconds, 1.minute, 2.minutes, 5.minutes, 10.minutes, 30.minutes, 1.hour]
  )

  def perform
    result = Printful::Operation::GetProducts.()
    raise 'retry' if result.failure?
  end
end