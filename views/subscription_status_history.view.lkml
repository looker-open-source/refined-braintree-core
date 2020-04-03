view: subscription_status_history {
  sql_table_name: @{DATASET_NAME}.SUBSCRIPTION_STATUS_HISTORY
    ;;

  dimension: balance {
    type: number
    sql: ${TABLE}.balance ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: subscription_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.subscription_id ;;
  }

  dimension: timestamp {
    type: string
    sql: ${TABLE}.timestamp ;;
  }

  dimension: user {
    type: string
    sql: ${TABLE}.user ;;
  }

  measure: count {
    type: count
    drill_fields: [subscription.id]
  }
}