terraform {
  required_providers {
    http = {
      source  = "hashicorp/http"
      version = "~> 3.0"
    }
  }
}

# Get your public IP from ipify.org

data "http" "my_ip" {
  url = "https://api.ipify.org"
}

# Format it to CIDR

locals {
  my_ip_cidr = "${trimspace(data.http.my_ip.response_body)}/32"
}

