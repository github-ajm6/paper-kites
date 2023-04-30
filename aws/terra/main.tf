terraform {
  backend "remote" {
    organization = "${ORGANIZATION}"

    workspaces {
      name = "${WORKSPACE}"
    }
  }
}

