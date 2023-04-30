include {
    path = find_in_parent_folders()
}

inputs = {
    newrelic_personal_apikey = "NRAK-***" # Your New Relic account ID
    newrelic_account_id = "12345" # Your New Relic account ID
    newrelic_region = "US" # US or EU (defaults to US)
}
