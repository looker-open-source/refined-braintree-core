view: registered_customer {
  sql_table_name: @{DATASET_NAME}.REGISTERED_CUSTOMER
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: created_at {
    type: string
    sql: ${TABLE}.created_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: updated_at {
    type: string
    sql: ${TABLE}.updated_at ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }

  measure: count {
    type: count
    drill_fields: [id, last_name, first_name]
  }
}