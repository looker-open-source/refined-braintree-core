view: transaction_add_on {
  sql_table_name: @{DATASET_NAME}.TRANSACTION_ADD_ON;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: amount {
    type: number
    hidden: yes
    sql: ${TABLE}.amount ;;
  }

  dimension: current_billing_cycle {
    type: number
    sql: ${TABLE}.current_billing_cycle ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: kind {
    type: string
    sql: ${TABLE}.kind ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: never_expires {
    type: yesno
    sql: ${TABLE}.never_expires ;;
  }

  dimension: number_of_billing_cycles {
    type: number
    sql: ${TABLE}.number_of_billing_cycles ;;
  }

  dimension: plan_id {
    type: number
    hidden: yes
    sql: ${TABLE}.plan_id ;;
  }

  dimension: quantity {
    type: number
    hidden: yes
    sql: ${TABLE}.quantity ;;
  }

  dimension: transaction_id {
    type: number
    hidden: yes
    sql: ${TABLE}.transaction_id ;;
  }

  measure: count {
    type: count
    label: "Number of Add-Ons"
    value_format_name: decimal_0
    drill_fields: [detail*]
  }

  measure: total_add_on_amount {
    type: sum
    sql: ${amount} ;;
    value_format_name: usd
  }

  measure: total_add_on_quantity {
    type: sum
    sql: ${quantity} ;;
    value_format_name: decimal_0
  }

  measure: average_add_on_quantity {
    type: average
    sql: ${quantity} ;;
    value_format_name: decimal_1
  }

  measure: average_add_on_amount {
    type: average
    sql: ${amount} ;;
    value_format_name: decimal_1
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
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
