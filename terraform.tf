terraform {
  required_version = ">= 0.14"
  
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }

  # cloud {
  #   organization = "yulai202020-org"
  #   workspaces {
  #     name = "digitalocean"
  #   }
  # }
}

provider "digitalocean" {
  token = var.apikey
}
