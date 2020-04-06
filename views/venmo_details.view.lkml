view: venmo_details {
  sql_table_name: `spencer-white-tckt87992.braintree.VENMO_DETAILS`
    ;;

  dimension: image_url {
    type: string
    sql: ${TABLE}.image_url ;;
  }

  dimension: source_description {
    type: string
    sql: ${TABLE}.source_description ;;
  }

  dimension: token {
    type: number
    sql: ${TABLE}.token ;;
  }

  dimension: transaction_id {
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.transaction_id ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }

  dimension: venmo_user_id {
    type: number
    sql: ${TABLE}.venmo_user_id ;;
  }

  measure: count {
    type: count
    label: "Number of Venmo Transactions"
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      username,
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
