class Plan < ApplicationRecord
  
  validates :name, :frequency, :amount, :symbol, :currency, :features, presence: true
  validates :name, uniqueness: true
  
  after_create :create_plan_on_stripe

  FREQUENCY = ["month", "year"]


      def create_plan_on_stripe
            begin
		      Stripe::Plan.create(:amount => amount * 100, :interval => frequency, :name => name, :currency => currency, :id => name,:trial_period_days => "0")
		rescue Exception => e
			Rails.logger.info "Exception:: #{e}"
		end
      end

  
end
