view: dispute {
  sql_table_name: `spencer-white-tckt87992.braintree.DISPUTE` ;;

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
    description: "The billing amount of the request."
  }

  dimension: kind {
    type: string
    sql: ${TABLE}.kind ;;
    description: "The kind of dispute. "
  }

  dimension: opened_date {
    type: string
    sql: ${TABLE}.opened_date ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}.reason ;;
    description: "The reason the dispute was created. "
  }

  dimension: received_date {
    type: string
    sql: ${TABLE}.received_date ;;
    description: "The date the dispute was received by the merchant."
  }

  dimension: reply_by_date {
    type: string
    sql: ${TABLE}.reply_by_date ;;
    description: "The merchant Reply By date that is referenced in the gateway."
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    description: "The status of the dispute. "
  }

  dimension: transaction_id {
    type: number
    sql: ${TABLE}.transaction_id ;;
  }

  dimension: won_date {
    type: string
    sql: ${TABLE}.won_date ;;
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
