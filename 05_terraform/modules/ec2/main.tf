resource "aws_instance" "ds_instance" {
  ami                         = var.ds_ami
  key_name                    = var.ds_keyname
  instance_type               = var.ds_instance_type
  security_groups             = ["${var.ds_sg_name}"]
  associate_public_ip_address = true
  availability_zone           = var.ds_az

  connection {
    type        = "ssh"
    host        = self.public_ip
    private_key = file(var.ds_private_key)
    user        = var.ds_username
  }
  provisioner "remote-exec" {
    scripts = ["./scripts/${var.ds_script}.sh"]
  }

  provisioner "local-exec" {
    command = "bash ./scripts/get_ip.sh ${self.public_ip}"
  }
  tags = {
    Name = var.ds_instance_name
  }
}