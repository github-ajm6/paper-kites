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
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  s3_force_path_style         = true
  access_key                  = "test"
  secret_key                  = "test"
}
EOF
}

