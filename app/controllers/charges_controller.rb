class ChargesController < ApplicationController
	def new
	end

	def create
	  # Amount in cents
	  @amount = $grand_total.to_i * 100

	  customer = Stripe::Customer.create({
	    email: params[:stripeEmail],
	    source: params[:stripeToken],
	  })

	  charge = Stripe::Charge.create({
	    customer: customer.id,
	    amount: @amount,
	    description: 'Criminal - Simple History Report',
	    currency: 'usd',
	  })
	@currentclient = Client.find_by(email: session[:userinfo][:info][:email])
	@firms = Firm.where(client_id: @currentclient.id, paid: false)
	@firms.each do |firm|
	  firm.paid = true
	  firm.save
	end
	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_create_path
	end
end
