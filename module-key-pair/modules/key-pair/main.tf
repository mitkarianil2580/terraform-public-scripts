

resource "aws_key_pair" "key_pairs" {
  count = length(var.key_pairs)
  key_name   = var.key_pairs[count.index].key_name
  public_key = tls_private_key.key_pairs[count.index].public_key_openssh
}

resource "tls_private_key" "key_pairs" {
  count      = length(var.key_pairs)
  algorithm  = "RSA"
  rsa_bits   = var.key_pairs[count.index].rsa_bits
}

resource "local_file" "private_key" {
  count       = length(var.key_pairs)
  content     = tls_private_key.key_pairs[count.index].private_key_pem
  filename    = "${var.key_pairs[count.index].key_name}.pem"
}

resource "local_file" "putty_key" {
  count       = length(var.key_pairs)
  content     = tls_private_key.key_pairs[count.index].private_key_pem
  filename    = "${var.key_pairs[count.index].key_name}.ppk"
  provisioner "local-exec" {
   command = "puttygen ${var.key_pairs[count.index].key_name}.pem -o ${var.key_pairs[count.index].key_name}.ppk"
  }
  provisioner "local-exec" {
   command = "cp -r ${var.key_pairs[count.index].key_name}.pem /home/anil/aws/" 
  }
}
