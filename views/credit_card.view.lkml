view: credit_card {
  sql_table_name: @{DATASET_NAME}.CREDIT_CARD
    ;;

  dimension: address_company {
    type: string
    sql: ${TABLE}.address_company ;;
  }

  dimension: address_country_name {
    type: string
    sql: ${TABLE}.address_country_name ;;
  }

  dimension: address_first_name {
    type: string
    sql: ${TABLE}.address_first_name ;;
  }

  dimension: address_last_name {
    type: string
    sql: ${TABLE}.address_last_name ;;
  }

  dimension: address_locality {
    type: string
    sql: ${TABLE}.address_locality ;;
  }

  dimension: address_postal_code {
    type: number
    sql: ${TABLE}.address_postal_code ;;
  }

  dimension: address_region {
    type: string
    sql: ${TABLE}.address_region ;;
  }

  dimension: address_street_address {
    type: string
    sql: ${TABLE}.address_street_address ;;
  }

  dimension: bin {
    type: number
    sql: ${TABLE}.bin ;;
  }

  dimension: card_type {
    type: string
    sql: ${TABLE}.card_type ;;
  }

  dimension: cardholder_name {
    type: string
    sql: ${TABLE}.cardholder_name ;;
  }

  dimension: commercial {
    type: yesno
    sql: ${TABLE}.commercial ;;
  }

  dimension: country_of_issuance {
    type: string
    sql: ${TABLE}.country_of_issuance ;;
  }

  dimension: created_at {
    type: string
    sql: ${TABLE}.created_at ;;
  }

  dimension: customer_location {
    type: string
    sql: ${TABLE}.customer_location ;;
  }

  dimension: debit {
    type: yesno
    sql: ${TABLE}.debit ;;
  }

  dimension: durbin_regulated {
    type: yesno
    sql: ${TABLE}.durbin_regulated ;;
  }

  dimension: expiration_month {
    type: string
    sql: ${TABLE}.expiration_month ;;
  }

  dimension: expiration_year {
    type: string
    sql: ${TABLE}.expiration_year ;;
  }

  dimension: healthcare {
    type: yesno
    sql: ${TABLE}.healthcare ;;
  }

  dimension: image_url {
    type: string
    sql: ${TABLE}.image_url ;;
  }

  dimension: is_default {
    type: yesno
    sql: ${TABLE}.is_default ;;
  }

  dimension: is_expired {
    type: yesno
    sql: ${TABLE}.is_expired ;;
  }

  dimension: is_venmo_sdk {
    type: yesno
    sql: ${TABLE}.is_venmo_sdk ;;
  }

  dimension: issuing_bank {
    type: string
    sql: ${TABLE}.issuing_bank ;;
  }

  dimension: last4 {
    type: number
    sql: ${TABLE}.last4 ;;
  }

  dimension: payroll {
    type: yesno
    sql: ${TABLE}.payroll ;;
  }

  dimension: prepaid {
    type: yesno
    sql: ${TABLE}.prepaid ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: token {
    type: number
    sql: ${TABLE}.token ;;
  }

  dimension: transaction_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.transaction_id ;;
    primary_key: yes
  }

  dimension: unique_number_identifier {
    type: number
    value_format_name: id
    sql: ${TABLE}.unique_number_identifier ;;
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
      address_last_name,
      address_country_name,
      address_first_name,
      cardholder_name,
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