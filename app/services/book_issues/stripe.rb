class BookIssues::Stripe
  INVALID_STRIPE_OPERATION = 'Invalid Stripe Operation'
  def self.execute(book_issue:, user:)
    book = book_issue.book
    # Check if the order is a plan
    if book.stripe_p_name.blank?
      charge = self.execute_charge(price: book.price,
                                   description: product.name,
                                   card_token:  book_issue.token)
    else
  	 #SUBSCRIPTIONS WILL BE HANDLED HERE
    end

    unless charge&.id.blank?
      # If there is a charge with id, set order paid.
      book_issue.charge_id = charge.id
      book_issue.set_paid
    end
  rescue Stripe::StripeError => e
    # If a Stripe error is raised from the API,
    # set status failed and an error message
    book_issue.error_message = INVALID_STRIPE_OPERATION
    book_issue.set_failed
  end
  private
  def self.execute_charge(price:, description:, card_token:)
    Stripe::Charge.create({
      amount: price.to_s,
      currency: "usd",
      description: description,
      source: card_token
    })
  end
end