project_name: "block-braintree"

################ Constants ################

constant: CONFIG_PROJECT_NAME {
  value: "block-braintree-config"
  export: override_required
}

constant: CONNECTION_NAME {
  value: "brick-layer"
  export: override_required
}

constant: DATASET_NAME {
  value: "braintree"
  export: override_required
}

################ Dependencies ################

local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"
}
