connection: "@{CONNECTION_NAME}"
label: "Braintree Block"

include: "views/*.view.lkml"
include: "*.explore.lkml"
include: "*.dashboard.lookml"
include: "//@{CONFIG_PROJECT_NAME}/views/*.view.lkml"
include: "//@{CONFIG_PROJECT_NAME}/*.model.lkml"
include: "//@{CONFIG_PROJECT_NAME}/*.dashboard"


explore: transaction {
  join: paypal_details {
    sql_on: ${transaction.id} = ${paypal_details.transaction_id} ;;
    relationship: many_to_one
  }
  join: android_pay_details {
    sql_on: ${transaction.id} = ${android_pay_details.transaction_id} ;;
    relationship: many_to_one
  }
  join: transaction_add_on {
    sql_on: ${transaction.id} = ${transaction_add_on.transaction_id} ;;
    relationship: one_to_one
  }
  join: dispute {
    sql_on: ${transaction.id} = ${dispute.transaction_id} ;;
    relationship: one_to_many
  }
  join: transaction_status_history {
    sql_on: ${transaction.id} = ${transaction_status_history.transaction_id} ;;
    relationship: one_to_many
  }
  join: transaction_discount {
    sql_on: ${transaction.id} = ${transaction_discount.transaction_id} ;;
    relationship: one_to_many
  }
  join: unregistered_customer {
    sql_on: ${transaction.id} = ${unregistered_customer.transaction_id} ;;
    relationship: one_to_one
  }
  join: venmo_details {
    sql_on: ${transaction.id} = ${venmo_details.transaction_id} ;;
    relationship: many_to_one
  }
  join: apple_pay_card {
    sql_on: ${transaction.id} = ${apple_pay_card.transaction_id} ;;
    relationship: many_to_one
  }
  join: masterpass_card_details {
    sql_on: ${transaction.id} = ${masterpass_card_details.transaction_id} ;;
    relationship: many_to_one
  }
  join: visa_checkout_details {
    sql_on: ${transaction.id} = ${visa_checkout_details.transaction_id} ;;
    relationship: many_to_one
  }
  join: credit_card {
    sql_on: ${transaction.id} = ${visa_checkout_details.transaction_id} ;;
    relationship: many_to_many
  }
  join: merchant_account {
    sql_on: ${transaction.merchant_account_id} = ${merchant_account.id} ;;
    relationship: many_to_one
  }
  join: registered_customer {
    sql_on: ${transaction.customer_id} = ${registered_customer.id} ;;
    relationship: many_to_one
  }
  join: customer_address {
    sql_on: ${registered_customer.id} = ${customer_address.customer_id} ;;
    relationship: one_to_many
  }
  join: subscription {
    sql_on: ${transaction.subscription_id} = ${subscription.id} ;;
    relationship: many_to_many
  }


}


explore: subscription {
  sql_always_where: ${transaction.subscription_id} IS NOT NULL ;;
  join: transaction {
    sql_on: ${subscription.id} = ${transaction.subscription_id} ;;
    relationship: one_to_many
  }
  join: registered_customer {
    sql_on: ${transaction.customer_id} = ${registered_customer.id};;
    relationship: many_to_one
  }
  join: customer_address {
    sql_on: ${registered_customer.id} = ${customer_address.customer_id} ;;
    relationship: one_to_many
  }
  join: subscription_discount {
    sql_on: ${subscription.id} = ${subscription_discount.id} ;;
    relationship: one_to_many
  }
  join: subscription_add_on {
    sql_on: ${subscription.id} = ${subscription_add_on.subscription_id} ;;
    relationship: one_to_many
  }
  join: subscription_status_history {
    sql_on: ${subscription.id} = ${subscription_status_history.subscription_id} ;;
    relationship: one_to_many
  }
  join: merchant_account {
    sql_on: ${subscription.merchant_account_id} = ${merchant_account.id} ;;
    relationship: many_to_one
  }


}
