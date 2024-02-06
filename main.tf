resource "digitalocean_ssh_key" "default" {
  name       = "ssh_key_yulain"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "digitalocean_droplet" "web" {
  count = 2

  image = "ubuntu-22-04-x64"
  name  = "web-${count.index}"

  region = "nyc1"
  size   = "s-1vcpu-1gb"


  user_data = file("init/init.sh")

  ssh_keys = [
    digitalocean_ssh_key.default.id
  ]
}


resource "digitalocean_loadbalancer" "web" {
  name   = "web-lb"
  region = "nyc1"

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 80
    target_protocol = "http"
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_ids = digitalocean_droplet.web.*.id
}

# resource "digitalocean_record" "main" {
#   domain = digitalocean_domain.domain.name
#   type   = "A"
#   name   = "@"
#   value  = digitalocean_droplet.web.0.ipv4_address
# }