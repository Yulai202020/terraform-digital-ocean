output "IP-1" {
  value = digitalocean_droplet.web.0.ipv4_address
}

output "IP-2" {
  value = digitalocean_droplet.web.1.ipv4_address
}

output "LB" {
  value = digitalocean_loadbalancer.web.ip
}

output "sshkey_fingerprint" {
  value       = digitalocean_ssh_key.default.fingerprint
  description = "sshkey_yulain"
}