#remote_state {
#  backend = "s3"
#  generate = {
#    path      = "backend.tf"
#  }
#  config = {
#    bucket         = "terrax"
#    key            = "${path_relative_to_include()}/terrax.tfstate"
#    region         = "us-east-1"
#    encrypt        = true
#    dynamodb_table = "terrax-lock-table"
#  }
#}

