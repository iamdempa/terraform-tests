module "instances" {
  source = "./ec2"
  servers = ["web", "db", "app"]
}

output "public_IPs" {
  value = "${module.instances.public_ip}"
}

