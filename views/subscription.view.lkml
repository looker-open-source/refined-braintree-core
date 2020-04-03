view: subscription {
  sql_table_name: @{DATASET_NAME}.SUBSCRIPTION
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: balance {
    type: number
    sql: ${TABLE}.balance ;;
  }

  dimension: billing_day_of_month {
    type: string
    sql: ${TABLE}.billing_day_of_month ;;
  }

  dimension: billing_period_end_date {
    type: string
    sql: ${TABLE}.billing_period_end_date ;;
  }

  dimension: billing_period_start_date {
    type: string
    sql: ${TABLE}.billing_period_start_date ;;
  }

  dimension: created_at {
    type: string
    sql: ${TABLE}.created_at ;;
  }

  dimension: current_billing_cycle {
    type: number
    sql: ${TABLE}.current_billing_cycle ;;
  }

  dimension: days_past_due {
    type: number
    sql: ${TABLE}.days_past_due ;;
  }

  dimension: failure_count {
    type: number
    sql: ${TABLE}.failure_count ;;
  }

  dimension: first_billing_date {
    type: string
    sql: ${TABLE}.first_billing_date ;;
  }

  dimension: has_trial_period {
    type: yesno
    sql: ${TABLE}.has_trial_period ;;
  }

  dimension: merchant_account_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.merchant_account_id ;;
  }

  dimension: never_expires {
    type: yesno
    sql: ${TABLE}.never_expires ;;
  }

  dimension: next_billing_date {
    type: string
    sql: ${TABLE}.next_billing_date ;;
  }

  dimension: next_billing_period_amount {
    type: number
    sql: ${TABLE}.next_billing_period_amount ;;
  }

  dimension: number_of_billing_cycles {
    type: number
    sql: ${TABLE}.number_of_billing_cycles ;;
  }

  dimension: paid_through_date {
    type: string
    sql: ${TABLE}.paid_through_date ;;
  }

  dimension: payment_method_token {
    type: string
    sql: ${TABLE}.payment_method_token ;;
  }

  dimension: plan_id {
    type: number
    sql: ${TABLE}.plan_id ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: trail_duration {
    type: number
    sql: ${TABLE}.trail_duration ;;
  }

  dimension: trial_duration_unit {
    type: string
    sql: ${TABLE}.trial_duration_unit ;;
  }

  dimension: updated_at {
    type: string
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      merchant_account.address_last_name,
      merchant_account.address_first_name,
      merchant_account.last_name,
      merchant_account.address_country_name,
      merchant_account.id,
      merchant_account.first_name,
      subscription_discount.count,
      subscription_status_history.count,
      transaction.count,
      subscription_add_on.count
    ]
  }
}