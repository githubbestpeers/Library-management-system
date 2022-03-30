# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


setupForm: ->
  $("#pay_with_paypal").click ->
    $("#paypal_checkout").show()
    $("#billing_fields").hide()
    true
    
  $("#pay_with_card").click ->
    $("#paypal_checkout").hide()
    $("#billing_fields").show()
    true
        
  $("#new_subscription").submit ->
    $("input[type=submit]").attr("disabled", true)
    if $("#card_number").length
      subscription.processCard()
      false
    else
      true