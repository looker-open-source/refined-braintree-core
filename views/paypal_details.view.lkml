view: paypal_details {
  sql_table_name: @{DATASET_NAME}.PAYPAL_DETAILS
    ;;

  dimension: authorization_id {
    type: number
    sql: ${TABLE}.authorization_id ;;
  }

  dimension: capture_id {
    type: number
    sql: ${TABLE}.capture_id ;;
  }

  dimension: custom_field {
    type: string
    sql: ${TABLE}.custom_field ;;
  }

  dimension: debug_id {
    type: number
    sql: ${TABLE}.debug_id ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: image_url {
    type: string
    sql: ${TABLE}.image_url ;;
  }

  dimension: payee_email {
    type: string
    sql: ${TABLE}.payee_email ;;
  }

  dimension: payer_email {
    type: string
    sql: ${TABLE}.payer_email ;;
  }

  dimension: payer_first_name {
    type: string
    sql: ${TABLE}.payer_first_name ;;
  }

  dimension: payer_id {
    type: number
    sql: ${TABLE}.payer_id ;;
  }

  dimension: payer_last_name {
    type: string
    sql: ${TABLE}.payer_last_name ;;
  }

  dimension: payer_status {
    type: string
    sql: ${TABLE}.payer_status ;;
  }

  dimension: payment_id {
    type: number
    sql: ${TABLE}.payment_id ;;
  }

  dimension: refund_id {
    type: number
    sql: ${TABLE}.refund_id ;;
  }

  dimension: seller_protection_status {
    type: string
    sql: ${TABLE}.seller_protection_status ;;
  }

  dimension: token {
    type: number
    sql: ${TABLE}.token ;;
  }

  dimension: transaction_fee_amount {
    type: number
    sql: ${TABLE}.transaction_fee_amount ;;
  }

  dimension: transaction_fee_currency_iso_code {
    type: string
    sql: ${TABLE}.transaction_fee_currency_iso_code ;;
  }

  dimension: transaction_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.transaction_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      payer_last_name,
      payer_first_name,
      transaction.shipping_address_country_name,
      transaction.billing_address_country_name,
      transaction.shipping_address_first_name,
      transaction.refunded_transaction_id,
      transaction.shipping_address_last_name,
      transaction.billing_address_first_name,
      transaction.billing_address_last_name
    ]
  }
}