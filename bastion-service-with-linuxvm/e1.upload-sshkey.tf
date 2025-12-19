resource "null_resource" "copy_ssh" {
    depends_on = [ azurerm_linux_virtual_machine.jump_vm ]
  connection {
    type = "ssh" #rdp
    host = azurerm_linux_virtual_machine.jump_vm.public_ip_address
    user = azurerm_linux_virtual_machine.jump_vm.admin_username
    private_key = file("${path.module}/ssh-keys/terraform-azure.pem")
  }
  provisioner "file" {
    source = "ssh-keys/terraform-azure.pem"
    destination = "/tmp/terraform-azure.pem"
  }
  provisioner "remote-exec" {
    inline = [ 
        "chmod 400 /tmp/terraform-azure.pem"
     ]
  }
}