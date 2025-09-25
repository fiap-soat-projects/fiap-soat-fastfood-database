resource "null_resource" "database_executor" {
  provisioner "local-exec" {
    environment = {
      MONGO_DB_NAME = var.database_name
    }

    command = var.command
  }
}
