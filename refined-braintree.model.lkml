connection: "@{CONNECTION_NAME}"
include: "/views/*"
include: "/*explore"

explore: transaction {
  extends: [transaction_core]
}

explore: subscription {
  extends: [subscription_core]
}
