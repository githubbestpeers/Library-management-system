class TotalFineController < ApplicationController
	def index
    @total_fines = total_fine.all
  end  
  # skip_before_action :verify_authenticity_token
 #  def index; end
 #  def create_total_fine
 #  	price = '100.00'
 #  request = PayPalCheckoutSdk::Orders::OrdersCreateRequest::new
 #  request.request_body({
 #    :intent => 'CAPTURE',
 #    :purchase_units => [
 #      {
 #        :amount => {
 #          :currency_code => 'USD',
 #          :value => price
 #        }
 #      }
 #    ]
 #  })
 #  begin
 #    response = @client.execute request
 #    order = Order.new
 #    order.price = price.to_i
 #    order.token = response.result.id
 #    if order.save
 #      return render :json => {:token => response.result.id}, :status => :ok
 #    end
 #  rescue PayPalHttp::HttpError => ioe
 #  end
 #  end

 #  def capture_total_fine
    
 #  end

 #   private
 #  def paypal_init
 #    client_id = 'YOUR-CLIENT-ID'
 #    client_secret = 'YOUR-CLIENT-SECRET'
 #    environment = PayPal::SandboxEnvironment.new client_id, client_secret
 #    @client = PayPal::PayPalHttpClient.new environment
 #  end
end
