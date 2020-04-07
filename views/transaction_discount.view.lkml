view: transaction_discount {
  sql_table_name: @{DATASET_NAME}.TRANSACTION_DISCOUNT
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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
    sql: ${TABLE}.transaction_id ;;
  }

  measure: total_discount_amount {
    type: sum
    sql: ${amount} ;;
    value_format_name: usd
  }

  measure: total_quantity {
    type: sum
    sql: ${quantity} ;;
    value_format_name: decimal_0
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}