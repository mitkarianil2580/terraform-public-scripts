variable "key_pairs" {
  type = list(object({
    key_name  = string
    rsa_bits  = number
  }))
}
