namespace :plans do
  task create: :environment do
    plans = [
        {payment_gateway_plan_identifier: "gold", name: "Gold",
         price_cents: 20_000, interval: "monthly"},
        {payment_gateway_plan_identifier: "silver", name: "Silver",
         price_cents: 10_000, interval: "monthly"}
    ]
    Plan.transaction do
      begin 
      	plans.each do |plan| 
          PaymentGateway::CreatePlanService.new(**plan).run 
        end
      rescue PaymentGateway::CreatePlanServiceError => e
      	puts "Error message: #{e.message}"
        puts "Exception message: #{e.exception_message}"
      end
    end
  end
end