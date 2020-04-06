view: credit_card {
  sql_table_name: `spencer-white-tckt87992.braintree.CREDIT_CARD` ;;

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
    description: "The first 6 digits of the credit card, known as the bank identification number (BIN)."
  }

  dimension: card_type {
    type: string
    sql: ${TABLE}.card_type ;;
    description: "The type of the credit card. "
  }

  dimension: cardholder_name {
    type: string
    sql: ${TABLE}.cardholder_name ;;
    description: "The cardholder name associated with the credit card."
  }

  dimension: commercial {
    type: yesno
    sql: ${TABLE}.commercial ;;
    description: "Whether the card type is a commercial card and is capable of processing Level 2 transactions. "
  }

  dimension: country_of_issuance {
    type: string
    sql: ${TABLE}.country_of_issuance ;;
    description: "The country that issued the credit card. Possible country values follow ISO 3166-1.The value Unknown will be returned if we cannot immediately determine the card's country of issuance from the bank identification number (BIN)."
  }

  dimension: created_at {
    type: string
    sql: ${TABLE}.created_at ;;
    description: "The date/time the object was created."
  }

  dimension: customer_location {
    type: string
    sql: ${TABLE}.customer_location ;;
    description: "This is US if the billing address is in the US or if a country is not specified. The location is International if the billing country passed is not the US."
    }

    dimension: debit {
    type: yesno
    sql: ${TABLE}.debit ;;
    }

    dimension: durbin_regulated {
    type: yesno
    sql: ${TABLE}.durbin_regulated ;;
    description: "A value indicating whether the issuing bank's card range is regulated by the Durbin Amendment due to the bank's assets. "
    }

    dimension: expiration_month {
    type: string
    sql: ${TABLE}.expiration_month ;;
    description: "The expiration month of a credit card, formatted MM. May be used with expiration_year, and instead of expiration_date."
  }

  dimension: expiration_year {
    type: string
    sql: ${TABLE}.expiration_year ;;
    description: "The two or four digit year associated with a credit card, formatted YYYY or YY. May be used with expiration_month, and instead of expiration_date."
  }

  dimension: healthcare {
    type: yesno
    sql: ${TABLE}.healthcare ;;
    description: "Whether the card is a healthcare card. "
  }

  dimension: image_url {
    type: string
    sql: ${TABLE}.image_url ;;
    description: "A URL that points to a payment method image resource (a PNG file) hosted by Braintree."
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
    description: "The bank that issued the credit card."
  }

  dimension: last4 {
    type: number
    sql: ${TABLE}.last4 ;;
    description: "The last 4 digits of the credit card number."
  }

  dimension: payroll {
    type: yesno
    sql: ${TABLE}.payroll ;;
    description: "Whether the card is a payroll card. "
  }

  dimension: prepaid {
    type: yesno
    sql: ${TABLE}.prepaid ;;
    description: "Whether the card is a prepaid card. "
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
    description: "The code for the product type of the card (e.g. D (Visa Signature Preferred), G (Visa Business)). See Product ID codes below for possible values."
  }

  dimension: token {
    type: number
    sql: ${TABLE}.token ;;
    description: "An alphanumeric value that references a specific payment method stored in your Vault."
  }

  dimension: transaction_id {
    type: number
    sql: ${TABLE}.transaction_id ;;
  }

  dimension: unique_number_identifier {
    type: number
    value_format_name: id
    sql: ${TABLE}.unique_number_identifier ;;
    description: "A randomly-generated string that uniquely identifies a credit card number in the Vault. If the same credit card is added to a merchant's Vault multiple times, each Vault entry will have the same unique identifier. This value is randomly generated by merchant gateway account, so it will be different for each merchant's Vault."
  }

  dimension: updated_at {
    type: string
    sql: ${TABLE}.updated_at ;;
    description: "The date/time the object was last updated."
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

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
