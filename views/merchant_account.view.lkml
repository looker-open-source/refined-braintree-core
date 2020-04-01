view: merchant_account {
  sql_table_name: `spencer-white-tckt87992.braintreedev_v1.MERCHANT_ACCOUNT`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

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

  dimension: currency_iso_code {
    type: string
    sql: ${TABLE}.currency_iso_code ;;
  }

  dimension: date_of_birth {
    type: string
    sql: ${TABLE}.date_of_birth ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: funding_details_account_number_last4 {
    type: number
    sql: ${TABLE}.funding_details_account_number_last4 ;;
  }

  dimension: funding_details_descriptor {
    type: string
    sql: ${TABLE}.funding_details_descriptor ;;
  }

  dimension: funding_details_destination {
    type: string
    sql: ${TABLE}.funding_details_destination ;;
  }

  dimension: funding_details_email {
    type: string
    sql: ${TABLE}.funding_details_email ;;
  }

  dimension: funding_details_mobile_phone {
    type: string
    sql: ${TABLE}.funding_details_mobile_phone ;;
  }

  dimension: funding_details_routing_number {
    type: number
    sql: ${TABLE}.funding_details_routing_number ;;
  }

  dimension: is_default {
    type: yesno
    sql: ${TABLE}.is_default ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      address_last_name,
      address_first_name,
      last_name,
      address_country_name,
      first_name,
      subscription.count,
      transaction.count
    ]
  }
}
