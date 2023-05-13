
resource "null_resource" "nr" {
  triggers = {
    value = "${var.rid}${data.terraform_remote_state.null.outputs.rid}"
    #value = "${var.rid}"
  }

  provisioner "local-exec" {
    command = <<EOT
        date >> /tmp/msg
    EOT
  }
}
