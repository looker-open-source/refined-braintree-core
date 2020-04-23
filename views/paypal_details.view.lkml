view: dispute_ndt {
  derived_table: {
    explore_source: transaction {
      column: count {
        field: dispute.count
      }

      column: reason_display {
        field: dispute.reason_display
      }

      filters: {
        field: dispute.reason_display
        value: "-NULL"
      }
    }
  }

  dimension: count {
    hidden: yes
    label: "Dispute Number of Disputes"
    type: number
  }

  dimension: reason_display {
    hidden: yes
  }
}
