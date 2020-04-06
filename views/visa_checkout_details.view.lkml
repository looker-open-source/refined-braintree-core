view: visa_checkout_details {
  sql_table_name: `spencer-white-tckt87992.braintree.VISA_CHECKOUT_DETAILS`
    ;;

  dimension: bin {
    type: number
    group_label: "Card Details"
    sql: ${TABLE}.bin ;;
  }

  dimension: call_id {
    type: number
    hidden: yes
    sql: ${TABLE}.call_id ;;
  }

  dimension: card_type {
    type: string
    group_label: "Card Details"
    sql: ${TABLE}.card_type ;;
  }

  dimension: cardholder_name {
    type: string
    group_label: "Card Details"
    sql: ${TABLE}.cardholder_name ;;
  }

  dimension: commercial {
    type: yesno
    sql: ${TABLE}.commercial ;;
  }

  dimension: country_of_issuance {
    type: string
    group_label: "Card Details"
    sql: ${TABLE}.country_of_issuance ;;
  }

  dimension: debit {
    type: yesno
    sql: ${TABLE}.debit ;;
  }

  dimension: durbin_regulated {
    type: yesno
    sql: ${TABLE}.durbin_regulated ;;
  }

  dimension: expiration_month {
    type: string
    group_label: "Card Details"
    sql: ${TABLE}.expiration_month ;;
  }

  dimension: expiration_year {
    type: string
    group_label: "Card Details"
    sql: ${TABLE}.expiration_year ;;
  }

  dimension: healthcare {
    type: yesno
    sql: ${TABLE}.healthcare ;;
  }

  dimension: image_url {
    type: string
    sql: ${TABLE}.image_url ;;
  }

  dimension: issuer_location {
    type: string
    group_label: "Card Details"
    sql: ${TABLE}.issuer_location ;;
  }

  dimension: issuing_bank {
    type: string
    group_label: "Card Details"
    sql: ${TABLE}.issuing_bank ;;
  }

  dimension: last4 {
    type: number
    group_label: "Card Details"
    sql: ${TABLE}.last4 ;;
  }

  dimension: payment_instrument_name {
    type: string
    sql: ${TABLE}.payment_instrument_name ;;
  }

  dimension: payroll {
    type: yesno
    sql: ${TABLE}.payroll ;;
  }

  dimension: prepaid {
    type: yesno
    sql: ${TABLE}.prepaid ;;
  }

  dimension: product_id {
    type: number
    hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: token {
    type: number
    group_label: "Card Details"
    sql: ${TABLE}.token ;;
  }

  dimension: transaction_id {
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.transaction_id ;;
  }

  measure: count {
    type: count
    label: "Number of Visa Checkout Transactions"
    value_format_name: decimal_0
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      payment_instrument_name,
      cardholder_name,
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
