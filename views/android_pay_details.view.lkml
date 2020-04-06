view: android_pay_details {
  sql_table_name: `spencer-white-tckt87992.braintree.ANDROID_PAY_DETAILS` ;;

  dimension: bin {
    type: number
    sql: ${TABLE}.bin ;;
    description: "The first 6 digits of the card number, also known as the Bank Identification Number (BIN). If this Google Pay card is network tokenized, its BIN may differ from the BIN of the underlying source card."
  }

  dimension: card_type {
    type: string
    sql: ${TABLE}.card_type ;;
    description: "The type of the credit card. "
  }

  dimension: expiration_month {
    type: string
    sql: ${TABLE}.expiration_month ;;
    description: "The expiration month of the credit card, formatted MM."
  }

  dimension: expiration_year {
    type: string
    sql: ${TABLE}.expiration_year ;;
    description: "The 2- or 4-digit year associated with the credit card, formatted YY or YYYY."
  }

  dimension: google_transaction_id {
    type: number
    sql: ${TABLE}.google_transaction_id ;;
    description: "A unique identifier provided by Google to track the payment method's transactions."
  }

  dimension: image_url {
    type: string
    sql: ${TABLE}.image_url ;;
    description: "A URL that points to a payment method image resource (a PNG file) hosted by Braintree."
  }

  dimension: last4 {
    type: number
    sql: ${TABLE}.last4 ;;
    description: "The last 4 digits of the credit card number."
  }

  dimension: source_card_last4 {
    type: number
    sql: ${TABLE}.source_card_last4 ;;
    description: "The last 4 digits of the payment method tokenized by the network."
  }

  dimension: source_card_type {
    type: string
    sql: ${TABLE}.source_card_type ;;
    description: "The card type. If this card is network tokenized, this is the card type of the customer's actual card."
  }

  dimension: source_description {
    type: string
    sql: ${TABLE}.source_description ;;
    description: "Indicates what type of payment method was tokenized by the network. Also includes an identifier for the account (e.g. last 4 digits if the payment method was a credit card)."
  }

  dimension: token {
    type: number
    sql: ${TABLE}.token ;;
    description: "An alphanumeric value that references a specific payment method stored in your Vault."
  }

  dimension: transaction_id {
    type: number
    sql: ${TABLE}.transaction_id ;;
  }

  dimension: virtual_card_last4 {
    type: number
    sql: ${TABLE}.virtual_card_last4 ;;
    description: "The last 4 digits of the card number. If this card is network tokenized, this is the last 4 digits of the device-specific account number (DPAN)."
  }

  dimension: virtual_card_type {
    type: string
    sql: ${TABLE}.virtual_card_type ;;
    description: "The card type. If this card is network tokenized, this is the card type of the network tokenized card."
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
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
