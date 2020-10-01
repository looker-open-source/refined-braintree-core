view: derived {
  derived_table: {
    sql:
    SELECT
      CASE WHEN dispute.reason = "cancelled_recurring_transaction" THEN "Canceled Recurring Transaction"
             WHEN dispute.reason = "credit_not_processed" THEN "Credit Not Processed"
             WHEN dispute.reason = "duplicate" THEN "Duplicate"
             WHEN dispute.reason = "fraud" THEN "Fraud"
             WHEN dispute.reason = "general" THEN "General"
             WHEN dispute.reason = "invalid_account" THEN "Invalid Account"
             WHEN dispute.reason = "not_recognized" THEN "Not Recognized"
             WHEN dispute.reason = "product_not_received" THEN "Product Not Received"
             WHEN dispute.reason = "product_unsatisfactory" THEN "Product Unsatisfactory"
             WHEN dispute.reason = "transaction_amount_differs" THEN "Transaction Amount Differs"
             ELSE NULL END
             AS dispute_reason_display,
      COALESCE(SUM(dispute.amount ), 0) AS dispute_total_dispute_amount
    FROM braintree.TRANSACTION  AS transaction
    LEFT JOIN @{DATASET_NAME}.DISPUTE  AS dispute ON transaction.id = dispute.transaction_id

    GROUP BY 1
    ORDER BY 2 DESC
    LIMIT @{ROW_FILTER};;
  }

dimension: dispute_reason_display {}
dimension: dispute_total_dispute_amount {}



}
