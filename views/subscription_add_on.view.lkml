view: subscription_add_on {
  sql_table_name: `spencer-white-tckt87992.braintreedev_v1.SUBSCRIPTION_ADD_ON`
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

  dimension: pland_id {
    type: number
    sql: ${TABLE}.pland_id ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: subscription_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.subscription_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, subscription.id]
  }
}
