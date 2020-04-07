include: "//@{CONFIG_PROJECT_NAME}/views/merchant_account.view.lkml"


view: merchant_account {
  extends: [merchant_account_config]
}

###################################################
view: merchant_account_core {
  sql_table_name: @{DATASET_NAME}.MERCHANT_ACCOUNT ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    description: "Specifies the ID of the sub-merchant, which can be referenced when creating transactions with service fees."
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
    description: "The ISO code for the currency the merchant account uses. See the ISO 4217 codes."
  }

  dimension: date_of_birth {
    type: string
    sql: ${TABLE}.date_of_birth ;;
    description: "The applicant's date of birth."
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
    description: "Email address composed of ASCII characters."
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
    description: "The first name."
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
    description: "The last name."
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
    description: "The phone number."
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    description: "The state of the merchant account can either be Pending, Active, or Suspended."
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

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
