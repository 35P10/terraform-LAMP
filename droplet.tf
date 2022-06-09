data "digitalocean_ssh_key" "ssh_key" {
  name = "terraform"
}

resource "digitalocean_droplet" "web" {
  image = "ubuntu-20-04-x64"
  name = "Test0"
  region = "nyc3"
  size = "s-1vcpu-1gb"
  user_data = file("userdata/init.yml")
  ssh_keys = [
    data.digitalocean_ssh_key.ssh_key.id
  ]
}