view: transaction_ndt {
  derived_table: {
    explore_source: transaction {
      column: tender_display {}

      column: count_declines {}
    }
  }

  dimension: tender_display {
    hidden: yes
  }

  dimension: count_declines {
    hidden: yes
    label: "Transaction Number of Declines"
    value_format: "#,##0"
    type: number
  }
}
