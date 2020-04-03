view: transaction_add_on {
  sql_table_name: @{DATASET_NAME}.TRANSACTION_ADD_ON
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: amount {
    type: number
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
    sql: ${TABLE}.plan_id ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
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