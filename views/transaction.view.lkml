view: transaction {
  sql_table_name: `spencer-white-tckt87992.braintree.TRANSACTION`
    ;;
  drill_fields: [refunded_transaction_id]

  dimension: refunded_transaction_id {
    type: number
    hidden: yes
    sql: ${TABLE}.refunded_transaction_id ;;
  }

  dimension: amount {
    type: number
    hidden: yes
    sql: ${TABLE}.amount ;;
  }

  dimension: authorized_transaction_id {
    type: number
    hidden: yes
    sql: ${TABLE}.authorized_transaction_id ;;
  }

  dimension: billing_address_company {
    group_label: "Billing"
    type: string
    sql: ${TABLE}.billing_address_company ;;
  }

  dimension: billing_address_country_name {
    type: string
    group_label: "Billing"
    sql: ${TABLE}.billing_address_country_name ;;
  }

  dimension: billing_address_first_name {
    type: string
    group_label: "Billing"
    sql: ${TABLE}.billing_address_first_name ;;
  }

  dimension: billing_address_last_name {
    type: string
    group_label: "Billing"
    sql: ${TABLE}.billing_address_last_name ;;
  }

  dimension: billing_address_locality {
    type: string
    group_label: "Billing"
    sql: ${TABLE}.billing_address_locality ;;
  }

  dimension: billing_address_postal_code {
    type: zipcode
    group_label: "Billing"
    sql: ${TABLE}.billing_address_postal_code ;;
  }

  dimension: billing_address_region {
    type: string
    group_label: "Billing"
    sql: ${TABLE}.billing_address_region ;;
  }

  dimension: billing_address_street_address {
    type: string
    group_label: "Billing"
    sql: ${TABLE}.billing_address_street_address ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension_group: created {
    type: time
    sql: ${TABLE}.created_at ;;
    timeframes: [raw, date, month, year]
  }

  dimension: currency_iso_code {
    type: string
    sql: ${TABLE}.currency_iso_code ;;
  }

  dimension: customer_id {
    type: number
    hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension: disbursement_date {
    group_label: "Disbursement"
    type: string
    sql: ${TABLE}.disbursement_date ;;
  }

  dimension: disbursement_funds_held {
    type: yesno
    group_label: "Disbursement"
    sql: ${TABLE}.disbursement_funds_held ;;
  }

  dimension: disbursement_settlement_amount {
    type: number
    group_label: "Disbursement"
    sql: ${TABLE}.disbursement_settlementAmount ;;
  }

  dimension: disbursement_settlement_currency_exchange_rate {
    type: number
    group_label: "Disbursement"
    sql: ${TABLE}.disbursement_settlementCurrencyExchangeRate ;;
  }

  dimension: disbursement_settlement_currency_iso_code {
    type: string
    group_label: "Disbursement"
    sql: ${TABLE}.disbursement_settlement_currency_iso_code ;;
  }

  dimension: disbursement_success {
    type: yesno
    group_label: "Disbursement"
    sql: ${TABLE}.disbursement_success ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
  }

  dimension: merchant_account_id {
    type: number
    hidden: yes
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
    hidden: yes
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
    hidden:  yes
    sql: ${TABLE}.risk_data_id ;;
  }

  dimension: service_fee_amount {
    type: number
    hidden: yes
    sql: ${TABLE}.service_fee_amount ;;
  }

  dimension: settlement_batch_id {
    type: number
    hidden: yes
    sql: ${TABLE}.settlement_batch_id ;;
  }

  dimension: shipping_address_company {
    type: string
    group_label: "Shipping"
    sql: ${TABLE}.shipping_address_company ;;
  }

  dimension: shipping_address_country_name {
    type: string
    group_label: "Shipping"
    sql: ${TABLE}.shipping_address_country_name ;;
  }

  dimension: shipping_address_first_name {
    type: string
    group_label: "Shipping"
    sql: ${TABLE}.shipping_address_first_name ;;
  }

  dimension: shipping_address_last_name {
    type: string
    group_label: "Shipping"
    sql: ${TABLE}.shipping_address_last_name ;;
  }

  dimension: shipping_address_locality {
    type: string
    group_label: "Shipping"
    sql: ${TABLE}.shipping_address_locality ;;
  }

  dimension: shipping_address_postal_code {
    type: zipcode
    group_label: "Shipping"
    sql: ${TABLE}.shipping_address_postal_code ;;
  }

  dimension: shipping_address_region {
    type: string
    group_label: "Shipping"
    sql: ${TABLE}.shipping_address_region ;;
  }

  dimension: shipping_address_street_address {
    type: string
    group_label: "Shipping"
    sql: ${TABLE}.shipping_address_street_address ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: subscription_id {
    type: number
    hidden: yes
    sql: ${TABLE}.subscription_id ;;
  }

  dimension: tax_amount {
    type: number
    sql: ${TABLE}.tax_amount ;;
    hidden: yes
  }

  dimension: tax_exempt {
    type: yesno
    sql: ${TABLE}.tax_exempt ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension_group: updated {
    type: time
    sql: ${TABLE}.updated_at ;;
    timeframes: [raw, date, month, year]
  }

  dimension: voice_referral_number {
    type: number
    sql: ${TABLE}.voice_referral_number ;;
  }

  measure: count {
    type: count
    label: "Number of Transactions"
    drill_fields: [detail*]
    value_format_name: decimal_0
  }

  measure: total_tax {
    type: sum
    sql: ${tax_amount} ;;
    value_format_name: usd
  }

  measure: total_amount {
    type: sum
    sql: ${amount} ;;
    value_format_name: usd
  }

  measure: total_service_fee {
    type: sum
    sql: ${service_fee_amount} ;;
    value_format_name: usd
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
