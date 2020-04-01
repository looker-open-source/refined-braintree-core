view: apple_pay_card {
  sql_table_name: `spencer-white-tckt87992.braintreedev_v1.APPLE_PAY_CARD`
    ;;

  dimension: card_type {
    type: string
    sql: ${TABLE}.card_type ;;
  }

  dimension: expiration_month {
    type: string
    sql: ${TABLE}.expiration_month ;;
  }

  dimension: expiration_year {
    type: string
    sql: ${TABLE}.expiration_year ;;
  }

  dimension: payment_instrument_name {
    type: string
    sql: ${TABLE}.payment_instrument_name ;;
  }

  dimension: source_description {
    type: string
    sql: ${TABLE}.source_description ;;
  }

  dimension: task4 {
    type: number
    sql: ${TABLE}.task4 ;;
  }

  dimension: token {
    type: number
    sql: ${TABLE}.token ;;
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
      payment_instrument_name,
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
