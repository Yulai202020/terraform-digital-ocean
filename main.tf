resource "digitalocean_ssh_key" "default" {
  name       = "sshkey_yulain"
  public_key = file("~/.ssh/id_rsa.pub")
}
