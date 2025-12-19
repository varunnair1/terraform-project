#we will create a load balancer
resource "azurerm_lb" "web_lb" {
  name                = "${local.resource_name_prefix}-lb"
  location            = azurerm_resource_group.rg-kyn.location
  resource_group_name = azurerm_resource_group.rg-kyn.name
  sku = "Standard"
  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.lb_publicip.id
  }
}
#we will create an backend pool and attach the same with lb
resource "azurerm_lb_backend_address_pool" "lb_backend_pool" {
  loadbalancer_id = azurerm_lb.web_lb.id
  name            = "BackEndAddressPool"
}
#lb probe
resource "azurerm_lb_probe" "lb_probe" {
  loadbalancer_id = azurerm_lb.web_lb.id
  name = "frontendprobe"
  protocol = "Tcp"
  #protocol = "Http"
  #request_path"="/var/www/html/mypage.php"
  port = 80 #this is application server port number 8080
  interval_in_seconds = 30 #every 30 second it is going to ping your application path or port number
  number_of_probes = 2 #1 min if it dont get response stop sending the request 
}
#lb_rule
resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id = azurerm_lb.web_lb.id 
  name = "lbrule"
  protocol = "Tcp"
  frontend_port = 80 #lb 
  backend_port = 80 #application port
  frontend_ip_configuration_name = azurerm_lb.web_lb.frontend_ip_configuration[0].name 
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.lb_backend_pool.id]
  probe_id = azurerm_lb_probe.lb_probe.id 
}

#now finally we need to attach the nic to the backend pool
resource "azurerm_network_interface_backend_address_pool_association" "nic_association" {
  for_each = var.autotype
  network_interface_id = azurerm_network_interface.webvm_nic[each.key].id 
  ip_configuration_name = azurerm_network_interface.webvm_nic[each.key].ip_configuration[0].name 
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_backend_pool.id 
}