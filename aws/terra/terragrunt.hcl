remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket         = "terrax"
    key            = "${path_relative_to_include()}/terrax.tfstate"
    region         = "us-east-1"
    #encrypt        = true
    dynamodb_table = "terrax-lock-table"
    endpoint       = "https://s3.localhost.localstack.cloud:4566"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents = <<EOF
provider "aws" {
  region              = "us-east-1"
  version             = "= 2.3.1"
  allowed_account_ids = ["1234567890"]
}
EOF
}

