variable "vm_instance_size" {
  description = "map of the instance size with different environment"
type = map(string)
default = {
  "testing" = "Standard_B1s", #1 core processor and 1 Gb of RAM
  "development" = "Standard_F2", #2 core 4 GB RAM
  "production" = "Standard_D2s_v3" #2 core with 8 GB RAM
}
}