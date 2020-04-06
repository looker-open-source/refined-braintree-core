view: android_pay_details {
  sql_table_name: `spencer-white-tckt87992.braintree.ANDROID_PAY_DETAILS`
    ;;

  dimension: bin {
    type: number
    group_label: "Card Details"
    sql: ${TABLE}.bin ;;
  }

  dimension: card_type {
    type: string
    group_label: "Card Details"
    sql: ${TABLE}.card_type ;;
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

  dimension: google_transaction_id {
    type: number
    hidden: yes
    sql: ${TABLE}.google_transaction_id ;;
  }

  dimension: image_url {
    type: string
    sql: ${TABLE}.image_url ;;
  }

  dimension: last4 {
    type: number
    group_label: "Card Details"
    sql: ${TABLE}.last4 ;;
  }

  dimension: source_card_last4 {
    type: number
    group_label: "Source Card Details"
    sql: ${TABLE}.source_card_last4 ;;
  }

  dimension: source_card_type {
    type: string
    group_label: "Source Card Details"
    sql: ${TABLE}.source_card_type ;;
  }

  dimension: source_description {
    type: string
    group_label: "Source Card Details"
    sql: ${TABLE}.source_description ;;
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

  dimension: virtual_card_last4 {
    type: number
    group_label: "Virtual Card Details"
    sql: ${TABLE}.virtual_card_last4 ;;
  }

  dimension: virtual_card_type {
    type: string
    group_label: "Virtual Card Details"
    sql: ${TABLE}.virtual_card_type ;;
  }

  measure: count {
    label: "Number of Android Pay Transactions"
    value_format_name: decimal_0
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
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
