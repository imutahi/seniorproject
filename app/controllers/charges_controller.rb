class ChargesController < ApplicationController
	def new
	end

	def create
	  # Amount in cents
	  @amount = 7500

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

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_create_path
	end
end
