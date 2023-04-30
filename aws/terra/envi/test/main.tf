
resource "null_resource" "nr" {
  triggers = {
    value = var.rid
  }

  provisioner "local-exec" {
    command = <<EOT
        date >> /tmp/msg
    EOT
  }
}
