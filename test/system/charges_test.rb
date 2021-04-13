require "application_system_test_case"

class ChargesTest < ApplicationSystemTestCase

  setup do
    # customer = Stripe::Customer.create({
    #   email: params["talontest7@gmail.com"],
    #   source: params[:tok_visa],
    # })

    # charge = Stripe.Charge.create({
    #   customer: customer_id,
    #   amount: 7500,
    #   description: 'Criminal - Simple History Report',
    #   currency: 'usd',
    # })
  end

  test "for charges controller" do
    # visit store_index_url
    # click_on "Buy Now"
    # visit charges_url
    # fill_in "6891ae20-9bd1-11eb-9140-ffa96d9a9c81", with: "talontest7@gmail.com"
    # fill_in "6891fc40-9bd1-11eb-9140-ffa96d9a9c81", with: "4242 4242 4242 4242"
    # fill_in "68922350-9bd1-11eb-9140-ffa96d9a9c81", with: "08 / 22"
    # fill_in "68922351-9bd1-11eb-9140-ffa96d9a9c81", with: "343"
    # click_on "Pay $75.00"
    # assert_text "Thanks, you paid $75.00!"
  end

end