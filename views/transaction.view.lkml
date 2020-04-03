view: transaction {
  sql_table_name: `spencer-white-tckt87992.braintree.TRANSACTION`
    ;;
  drill_fields: [refunded_transaction_id]

  dimension: refunded_transaction_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.refunded_transaction_id ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: authorized_transaction_id {
    type: number
    sql: ${TABLE}.authorized_transaction_id ;;
  }

  dimension: billing_address_company {
    type: string
    sql: ${TABLE}.billing_address_company ;;
  }

  dimension: billing_address_country_name {
    type: string
    sql: ${TABLE}.billing_address_country_name ;;
  }

  dimension: billing_address_first_name {
    type: string
    sql: ${TABLE}.billing_address_first_name ;;
  }

  dimension: billing_address_last_name {
    type: string
    sql: ${TABLE}.billing_address_last_name ;;
  }

  dimension: billing_address_locality {
    type: string
    sql: ${TABLE}.billing_address_locality ;;
  }

  dimension: billing_address_postal_code {
    type: number
    sql: ${TABLE}.billing_address_postal_code ;;
  }

  dimension: billing_address_region {
    type: string
    sql: ${TABLE}.billing_address_region ;;
  }

  dimension: billing_address_street_address {
    type: string
    sql: ${TABLE}.billing_address_street_address ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: created_at {
    type: string
    sql: ${TABLE}.created_at ;;
  }

  dimension: currency_iso_code {
    type: string
    sql: ${TABLE}.currency_iso_code ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: disbursement_date {
    type: string
    sql: ${TABLE}.disbursement_date ;;
  }

  dimension: disbursement_funds_held {
    type: yesno
    sql: ${TABLE}.disbursement_funds_held ;;
  }

  dimension: disbursement_settlement_amount {
    type: number
    sql: ${TABLE}.disbursement_settlementAmount ;;
  }

  dimension: disbursement_settlement_currency_exchange_rate {
    type: number
    sql: ${TABLE}.disbursement_settlementCurrencyExchangeRate ;;
  }

  dimension: disbursement_settlement_currency_iso_code {
    type: string
    sql: ${TABLE}.disbursement_settlement_currency_iso_code ;;
  }

  dimension: disbursement_success {
    type: yesno
    sql: ${TABLE}.disbursement_success ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: merchant_account_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.merchant_account_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: payment_instrument_type {
    type: string
    sql: ${TABLE}.payment_instrument_type ;;
  }

  dimension: plan_id {
    type: number
    sql: ${TABLE}.plan_id ;;
  }

  dimension: processor_authorization_code {
    type: number
    sql: ${TABLE}.processor_authorization_code ;;
  }

  dimension: purchase_order_number {
    type: number
    sql: ${TABLE}.purchase_order_number ;;
  }

  dimension: recurring {
    type: yesno
    sql: ${TABLE}.recurring ;;
  }

  dimension: risk_data_decision {
    type: string
    sql: ${TABLE}.risk_data_decision ;;
  }

  dimension: risk_data_id {
    type: number
    sql: ${TABLE}.risk_data_id ;;
  }

  dimension: service_fee_amount {
    type: number
    sql: ${TABLE}.service_fee_amount ;;
  }

  dimension: settlement_batch_id {
    type: number
    sql: ${TABLE}.settlement_batch_id ;;
  }

  dimension: shipping_address_company {
    type: string
    sql: ${TABLE}.shipping_address_company ;;
  }

  dimension: shipping_address_country_name {
    type: string
    sql: ${TABLE}.shipping_address_country_name ;;
  }

  dimension: shipping_address_first_name {
    type: string
    sql: ${TABLE}.shipping_address_first_name ;;
  }

  dimension: shipping_address_last_name {
    type: string
    sql: ${TABLE}.shipping_address_last_name ;;
  }

  dimension: shipping_address_locality {
    type: string
    sql: ${TABLE}.shipping_address_locality ;;
  }

  dimension: shipping_address_postal_code {
    type: number
    sql: ${TABLE}.shipping_address_postal_code ;;
  }

  dimension: shipping_address_region {
    type: string
    sql: ${TABLE}.shipping_address_region ;;
  }

  dimension: shipping_address_street_address {
    type: string
    sql: ${TABLE}.shipping_address_street_address ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: subscription_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.subscription_id ;;
  }

  dimension: tax_amount {
    type: number
    sql: ${TABLE}.tax_amount ;;
  }

  dimension: tax_exempt {
    type: yesno
    sql: ${TABLE}.tax_exempt ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: updated_at {
    type: string
    sql: ${TABLE}.updated_at ;;
  }

  dimension: voice_referral_number {
    type: number
    sql: ${TABLE}.voice_referral_number ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      refunded_transaction_id,
      shipping_address_country_name,
      billing_address_country_name,
      shipping_address_first_name,
      shipping_address_last_name,
      billing_address_first_name,
      billing_address_last_name,
      subscription.id,
      merchant_account.address_last_name,
      merchant_account.address_first_name,
      merchant_account.last_name,
      merchant_account.address_country_name,
      merchant_account.id,
      merchant_account.first_name,
      unregistered_customer.count,
      android_pay_details.count,
      apple_pay_card.count,
      masterpass_card_details.count,
      transaction_status_history.count,
      credit_card.count,
      paypal_details.count,
      dispute.count,
      visa_checkout_details.count,
      transaction_add_on.count,
      venmo_details.count
    ]
  }
}
