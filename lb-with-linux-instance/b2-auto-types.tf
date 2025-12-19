variable "autotype" {
  description = "different type of vehicle"
  type = map(string)
  default = {
    "bentley" = "vwg",
    "audi" = "vwg",
    
  }
}
#once i put the for loop in nic and vm